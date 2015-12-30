class CreateTwitterInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :twitter_informations do |t|
      t.references :participation, index: true, foreign_key: true, null: false
      t.references :event, index: true, foreign_key: true, null: false 
      t.string :screen_name, null: false
      t.string :name, null: false
      t.string :placement_day
      t.string :placement_block
      t.integer :placement_number
      t.string :placement_ab

      t.timestamps
    end

    add_index :twitter_informations, :screen_name, unique: true
    add_index :twitter_informations, [:event_id, :screen_name], unique: true, using: :btree
  end
end
