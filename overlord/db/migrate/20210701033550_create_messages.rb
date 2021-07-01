class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :guid
      t.string :event_name
      t.string :data

      t.timestamps
    end
  end
end
