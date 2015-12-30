class CreateItemInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :item_informations do |t|
      t.references :participation, null: false, index: true, foreign_key: true
      t.references :consignment, index: true, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.string :url
      t.integer :cost
      t.boolean :want, null: false, default: false

      t.timestamps
    end
  end
end
