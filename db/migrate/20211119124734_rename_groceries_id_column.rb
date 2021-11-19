class RenameGroceriesIdColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :suppliers, :groceries_id, :grocery_id
  end
end
