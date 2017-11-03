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

    it 'save but with errors and success on create ImportPurchaseLines' do
      import_purchase = build(:import_purchase)
      import_purchase.import_file = File.new("#{Rails.root}/spec/factories/example_input_with_errors.tab")
      expect(import_purchase.save).to eq(true)
      expect(import_purchase.lines_with_errors).to eq(5)
      expect(import_purchase.import_purchase_lines.with_errors.count).to eq(5)
      import_purchase.import_purchase_lines.with_errors.each do |import_purchase_line|
        import_purchase_line.result.should_not be_nil
      end
      expect(import_purchase.lines_with_success).to eq(6)
      expect(import_purchase.lines_importeds).to eq(11)
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
