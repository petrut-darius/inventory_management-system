class AddMamaToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :mama, :boolean
  end
end
