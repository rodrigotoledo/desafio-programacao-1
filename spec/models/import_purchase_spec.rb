require 'rails_helper'

RSpec.describe ImportPurchase, type: :model do
  describe 'CRUD for ImportPurchase with success' do
    it 'create with ImportPurchase with attributes' do
      import_purchase = build(:import_purchase)
      expect(import_purchase.save).to eq(true)
    end
  end

  describe 'CRUD for ImportPurchase with error' do
    it 'fail on create ImportPurchase without attributes' do
      import_purchase = ImportPurchase.new
      expect(import_purchase.save).to eq(false)
    end
  end
end
