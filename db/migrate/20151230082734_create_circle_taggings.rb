class CreateCircleTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :circle_taggings do |t|
      t.references :circle, index: true, foreign_key: true, null: false
      t.references :tag, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
