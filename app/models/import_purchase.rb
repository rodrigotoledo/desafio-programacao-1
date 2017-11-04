class ImportPurchase < ApplicationRecord
	belongs_to :user
	has_many :import_purchase_lines
	has_attached_file :import_file

	validates :import_file, attachment_presence: true
	do_not_validate_attachment_file_type :import_file
	validates :user_id, presence: true

	before_create :set_initial_status
	after_create :import_in_background

	def import_purchase_lines_in_background
		self.update_attribute(:status, :running)
		File.open(self.import_file.path).each_with_index do |line, i|
			next if i == 0
			import_purchase_line = self.import_purchase_lines.build
			if import_purchase_line.import_line(line)
				self.update_attribute(:lines_with_success, self.lines_with_success.to_i + 1)
			else
				self.update_attribute(:lines_with_errors, self.lines_with_errors.to_i + 1)
			end
			self.update_attribute(:lines_importeds, self.lines_importeds.to_i + 1)
		end
		self.update_attribute(:status, :finished)
	end

	private
		def import_in_background
			ImportPurchaseJob.perform_later(self.id)
		end

		def set_initial_status
			self.status = :initialized
		end
end
