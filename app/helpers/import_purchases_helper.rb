module ImportPurchasesHelper
  def status_of_import_purchase(import_purchase)
    t("import_status.#{import_purchase.status}")
  end
end
