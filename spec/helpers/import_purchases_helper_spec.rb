require 'rails_helper'

RSpec.describe ImportPurchasesHelper do
  describe 'informations of status' do
    it 'translate ImportPurchase initialized status' do
      import_purchase = ImportPurchase.new(status: :initialized)
      expect(helper.status_of_import_purchase(import_purchase)).to eq('Inicializado')
    end

    it 'translate ImportPurchase running status' do
      import_purchase = ImportPurchase.new(status: :running)
      expect(helper.status_of_import_purchase(import_purchase)).to eq('Em andamento')
    end

    it 'translate ImportPurchase finished status' do
      import_purchase = ImportPurchase.new(status: :finished)
      expect(helper.status_of_import_purchase(import_purchase)).to eq('Finalizado')
    end
  end
end
