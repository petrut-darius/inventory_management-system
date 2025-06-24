class Location < ApplicationRecord
  has_many :inventory_items
  validates :name, :address, presence: true
end
