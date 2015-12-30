class CreateParticipationTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :participation_taggings do |t|
      t.references :participation, index: true, foreign_key: true, null: false
      t.references :tag, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
