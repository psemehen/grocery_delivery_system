class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :sku, index: { unique: true }
      t.integer :qty
      t.datetime :issue_time
      t.datetime :delivery_time
      t.datetime :deliver_until

      t.timestamps
    end
  end
end
