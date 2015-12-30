class AddCirclecutToWebcatalogInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :webcatalog_informations, :circlecut_url, :string
  end
end
