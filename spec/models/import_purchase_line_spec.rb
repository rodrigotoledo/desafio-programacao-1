require 'rails_helper'

RSpec.describe ImportPurchaseLine, type: :model do
  describe 'CRUD with success for ImportPurchaseLine' do
    it 'Import a single line with success' do
      import_purchase_line = build(:import_purchase_line)
      expect(import_purchase_line.save).to eq(true)
    end
  end

  describe 'CRUD with error for ImportPurchaseLine' do
    it 'Fail on import a single single' do
      import_purchase_line = ImportPurchaseLine.new
      expect(import_purchase_line.save).to eq(false)
    end
  end
end
