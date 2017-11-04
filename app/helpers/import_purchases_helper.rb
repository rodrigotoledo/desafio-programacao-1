module ImportPurchasesHelper
  def status_of_import_purchase(status)
    t("import_status.#{status}")
  end

  def merchant_address_info(import_purchase_line)
  	t('merchant_address_info', merchant_name: (import_purchase_line.merchant_name || t('merchant_without_name')), merchant_address: import_purchase_line.merchant_address || t('merchant_without_address'))
  end

  def merchant_price(import_purchase_line)
  	return if import_purchase_line.item_price.blank?
  	number_to_currency(import_purchase_line.item_price)
  end
end
