class AddLinesWithErrorsAndLinesWithSuccessToImportPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :import_purchases, :lines_with_errors, :integer
    add_column :import_purchases, :lines_with_success, :integer
  end
end
