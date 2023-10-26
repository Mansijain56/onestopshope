class Voucher < ApplicationRecord
  belongs_to :user
  has_many :payment_details
end
