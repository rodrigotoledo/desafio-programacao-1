class CreateImportPurchaseLines < ActiveRecord::Migration[5.1]
  def change
    create_table :import_purchase_lines do |t|
      t.references :import_purchase, foreign_key: true
      t.string :purchaser_name
      t.text :item_description
      t.float :item_price
      t.integer :purchase_count
      t.string :merchant_address
      t.string :merchant_name
      t.string :result

      t.timestamps
    end
  end
end
