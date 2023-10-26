class ViewCount < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
