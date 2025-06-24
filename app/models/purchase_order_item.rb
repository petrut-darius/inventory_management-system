class PurchaseOrderItem < ApplicationRecord
  belongs_to :product

  before_validation :set_cost

  private

  def set_cost
    return unless product && quantity.present?

    self.cost_price = product.price * quantity
  end
end
