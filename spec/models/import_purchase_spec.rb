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
end
