class CreateImportPurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :import_purchases do |t|
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
