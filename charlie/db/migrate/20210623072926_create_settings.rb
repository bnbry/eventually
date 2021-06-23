class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.string :name
      t.string :status
      t.string :guid
      t.integer :version

      t.timestamps
    end
  end
end
