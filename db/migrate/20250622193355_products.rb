class Products < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :sku, null: false
      t.string :description, null: false
      t.integer :reorder_level, null: false
      t.decimal :price, null: false
      t.integer :quantity, null: false

      t.timestamps
    end

    add_index :products, :sku, unique: true
  end
end
