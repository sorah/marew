class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :slug, null: false
      t.datetime :starts_at, null: false
      t.text :description

      t.timestamps
    end
  end
end
