class CreateSettingsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.string  :name
      t.boolean :enabled
      t.integer  :version
      t.string  :settings_guid

      t.timestamps
    end
  end
end
