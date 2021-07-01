class AddSettingsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.boolean :discount_enabled
      t.boolean :fee_enabled
      t.integer :version
      t.string :guid

      t.timestamps
    end
  end
end
