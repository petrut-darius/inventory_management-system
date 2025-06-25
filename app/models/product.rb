class Product < ApplicationRecord
  has_one :inventory_item, dependent: :destroy
  has_many :purchase_order_items, dependent: :destroy
  validates :sku, presence: true
end
