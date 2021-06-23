class AddSettingsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.boolean :bar_enabled
      t.boolean :foo_enabled
      t.string :version
      t.string :settings_guid

      t.timestamps
    end
  end
end
