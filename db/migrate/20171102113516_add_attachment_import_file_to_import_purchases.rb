class AddAttachmentImportFileToImportPurchases < ActiveRecord::Migration[5.1]
  def change
    add_attachment :import_purchases, :import_file
  end
end
