class CreatePurchaseOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :purchase_orders do |t|
      t.belongs_to :supplier, index: true, foreign_key: true
      t.string :status, null: false
      t.datetime :received_at, null: false

      t.timestamps
    end
  end
end
