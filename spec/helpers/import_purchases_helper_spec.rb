require 'rails_helper'

RSpec.describe ImportPurchasesHelper do
  describe 'informations of status' do
    it 'translate ImportPurchase initialized status' do
      import_purchase = ImportPurchase.new(status: :initialized)
      expect(helper.status_of_import_purchase(import_purchase.status)).to eq('Inicializado')
    end

    it 'translate ImportPurchase running status' do
      import_purchase = ImportPurchase.new(status: :running)
      expect(helper.status_of_import_purchase(import_purchase.status)).to eq('Em andamento')
    end

    it 'translate ImportPurchase finished status' do
      import_purchase = ImportPurchase.new(status: :finished)
      expect(helper.status_of_import_purchase(import_purchase.status)).to eq('Finalizado')
    end
  end

  describe 'Helpers for fail attributes' do
    it 'adjust merchant informations when dont have merchant_name' do
    	import_purchase_line = ImportPurchaseLine.new(merchant_address: 'Rua ABC')
    	expect(helper.merchant_address_info(import_purchase_line)).to eq('Nome não importado, localizada em: Rua ABC')
    end

    it 'adjust merchant informations when dont have merchant_address' do
    	import_purchase_line = ImportPurchaseLine.new(merchant_name: 'Loja ABC')
    	expect(helper.merchant_address_info(import_purchase_line)).to eq('Loja ABC, localizada em: Endereço não importado')
    end

    it 'adjust merchant informations when dont have any informations' do
    	import_purchase_line = ImportPurchaseLine.new
    	expect(helper.merchant_address_info(import_purchase_line)).to eq('Nome não importado, localizada em: Endereço não importado')
    end
  end
end
