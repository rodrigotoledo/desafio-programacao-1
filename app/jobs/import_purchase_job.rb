class ImportPurchaseJob < ApplicationJob
	queue_as :default

	def perform(import_purchase_id)
		import_purchase = ImportPurchase.find(import_purchase_id)
		import_purchase.import_purchase_lines_in_background
	end
end
