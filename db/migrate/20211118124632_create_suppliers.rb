class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :description
      t.references :groceries, foreign_key: true

      t.timestamps
    end
  end
end
