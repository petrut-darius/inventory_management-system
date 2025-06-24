class CreateSuppliers < ActiveRecord::Migration[8.0]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :address, null: false

      t.timestamps
    end
    add_index :suppliers, :name, unique: true
  end
end
