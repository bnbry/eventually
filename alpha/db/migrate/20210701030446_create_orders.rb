class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :cart_guid
      t.string :product
      t.integer :price
      t.string :guid
      t.integer :fee
      t.integer :discount

      t.timestamps
    end
  end
end
