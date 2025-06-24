class Product < ApplicationRecord
  has_one :inventory_items
  has_many :purchase_order_items
  validates :sku, presence: true
end
