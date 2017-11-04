class ImportPurchaseLine < ApplicationRecord
	scope :with_errors, -> { where("result IS NOT NULL") }
	scope :with_success, -> { where("result IS NULL") }
	belongs_to :import_purchase
	validates :purchaser_name, :item_description, :merchant_address, :merchant_name, presence: true
	validates :item_price, :purchase_count, numericality: true, presence: true


	def import_line(line)
		return false if line.to_s.blank?
		data = line.split(/\t/)
		self.purchaser_name = data[0]
		self.item_description = data[1]
		self.item_price = data[2]
		self.purchase_count = data[3]
		self.merchant_address = data[4]
		self.merchant_name = data[5]
		if self.save
			true
		else
			self.valid?
			self.result = self.errors.full_messages.join(", ")
			self.save(validate: false)
			false
		end
	end
end
