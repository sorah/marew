class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.integer :placement_day, null: false
      t.string :placement_block, null: false
      t.integer :placement_number, null: false
      t.string :placement_ab, null: false
      t.references :circle, index: true, foreign_key: true, null: false
      t.references :event, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
