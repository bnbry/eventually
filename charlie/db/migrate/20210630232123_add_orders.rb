class AddOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :product
      t.integer :total
      t.string :guid
      t.integer :fee

      t.timestamps
    end
  end
end
