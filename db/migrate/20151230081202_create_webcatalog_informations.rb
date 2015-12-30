class CreateWebcatalogInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :webcatalog_informations do |t|
      t.references :participation, index: true, foreign_key: true, null: false
      t.references :event, index: true, foreign_key: true, null: false 
      t.string :webcatalog_id_str, null: false
      t.string :name, null: false
      t.string :placement_day
      t.string :placement_block
      t.integer :placement_number
      t.string :placement_ab
      t.text :comment

      t.timestamps
    end

    add_index :webcatalog_informations, [:event_id, :webcatalog_id_str], unique: true, using: :btree
  end
end
