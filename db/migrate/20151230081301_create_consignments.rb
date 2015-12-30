class CreateConsignments < ActiveRecord::Migration[5.0]
  def change
    create_table :consignments do |t|
      t.references :circle, index: true, foreign_key: true, null: false
      t.references :participation, index: true, foreign_key: true

      t.timestamps
    end
  end
end
