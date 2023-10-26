class Product < ApplicationRecord
  include GenerateCsv
  belongs_to :user
  has_many_attached :images
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :view_counts, dependent: :destroy
end
