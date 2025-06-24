class CreatePurchaseOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :purchase_order_items do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.integer :quantity, null: false
      t.integer :cost_price, null: false

      t.timestamps
    end
  end
end
