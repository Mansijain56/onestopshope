class User < ApplicationRecord
  require 'open-uri'

  has_one :profile, dependent: :destroy
  has_many :products, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :voucher, dependent: :destroy
  has_many :view_counts, dependent: :destroy

  validates_presence_of :mobile, unless: -> { from_omniauth? }

   after_create :initiate_profile, :grab_image, :initiate_cart, :initiate_voucher
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable 
  attr_accessor :login

  devise :database_authenticatable, :validatable,  :lockable, :registerable, :recoverable, :rememberable, :omniauthable ,omniauth_providers: [:facebook, :google_oauth2], authentication_keys: [:login]

  def login
     @login || self.email || self.mobile
  end
  
  def initiate_profile
    self.create_profile(name: $name || "")
    $name = nil
  end

  def initiate_cart
    self.create_cart
  end

  def initiate_voucher
    self.create_voucher
  end

  def grab_image
    if $image.present?
      downloaded_image = URI.parse($image).open
      self.profile.avatar.attach(io: downloaded_image, filename: "#{self.profile.id.to_s + self.profile.name}.jpg")
    end
    $image = nil
  end

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if (login = conditions.delete(:login))
        unless login.to_i == 0 
          where(conditions.to_h).where(["lower(email)= :value OR (mobile)= :value", { :value => login.downcase } ]).first
        else
          where(conditions.to_h).where(["lower(email)= :value", { :value => login.downcase } ]).first
        end
      elsif conditions.has_key?(:mobile) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.find_by(email: data['email'])

      unless user
        $name = data['name']
        $image = data['image']
          user = User.create(
            email: data['email'],
            password: Devise.friendly_token[0,20]
          )
      end
      user.provider = access_token.provider
      user.uid = access_token.uid
      user.save
      user
    end

    private

    def from_omniauth?
      provider && uid
    end

end
