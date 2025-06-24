class CreateInventoryItems < ActiveRecord::Migration[8.0]
  def change
    create_table :inventory_items do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :location, index: true, foreign_key: true

      t.timestamps
    end
  end
end
