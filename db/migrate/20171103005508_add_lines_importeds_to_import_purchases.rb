class AddLinesImportedsToImportPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :import_purchases, :lines_importeds, :integer
  end
end
