require 'rails_helper'

RSpec.describe ImportPurchase, type: :model do
  describe 'CRUD for ImportPurchase' do
    it 'fail on create ImportPurchase without attributes' do
      import_purchase = ImportPurchase.new
      expect(import_purchase.save).to eq(false)
    end

    it 'create with ImportPurchase with attributes' do
      import_purchase = build(:import_purchase)
      expect(import_purchase.save).to eq(true)
    end
  end

  describe 'Import Line process' do
    it 'Import lines of file with success' do
      import_purchase = build(:import_purchase)
      import_purchase.save
      expect(import_purchase.import_purchase_lines.count).to eq(4)
      expect(import_purchase.status).to eq("finished")
    end
  end
end
