class AddTotalToImportPurchaseLines < ActiveRecord::Migration[5.1]
  def change
    add_column :import_purchase_lines, :total, :float
  end
end
