class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.boolean :fee
      t.boolean :discount
      t.string :product
      t.integer :price
      t.string :guid

      t.timestamps
    end
  end
end
