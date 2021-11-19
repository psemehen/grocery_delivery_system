class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku, index: { unique: true }
      t.text :description
      t.float :price
      t.references :category, foreign_key: true
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
