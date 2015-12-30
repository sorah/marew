class CreateErrands < ActiveRecord::Migration[5.0]
  def change
    create_table :errands do |t|
      t.references :participation, null: false, index: true, foreign_key: true
      t.text :note
      t.integer :priority

      t.timestamps
    end
  end
end
