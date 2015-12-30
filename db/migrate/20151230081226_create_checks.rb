class CreateChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :checks do |t|
      t.references :participation, null: false, index: true, foreign_key: true
      t.text :note
      t.integer :priority

      t.timestamps
    end
  end
end
