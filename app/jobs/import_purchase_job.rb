class ImportPurchaseJob < ApplicationJob
  queue_as :default

  def perform(import_purchase)
    import_purchase.import_purchase_lines_in_background
  end
end
