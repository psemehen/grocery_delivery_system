class CreateGroceries < ActiveRecord::Migration[7.0]
  def change
    create_table :groceries do |t|
      t.string :name, index: { unique: true }
      t.text :description

      t.timestamps
    end
  end
end
