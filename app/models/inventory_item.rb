class InventoryItem < ApplicationRecord
  belongs_to :product
  belongs_to :location
end
