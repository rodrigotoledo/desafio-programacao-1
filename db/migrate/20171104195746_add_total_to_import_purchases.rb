class AddTotalToImportPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :import_purchases, :total, :float
  end
end
