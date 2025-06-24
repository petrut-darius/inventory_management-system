class Supplier < ApplicationRecord
  has_many :purchase_orders
  validates :name, :email, :address, :phone, presence: true
end
