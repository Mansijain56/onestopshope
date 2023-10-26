class PaymentDetail < ApplicationRecord
  belongs_to :order
  belongs_to :voucher
end
