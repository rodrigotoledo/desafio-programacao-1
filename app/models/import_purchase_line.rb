class ImportPurchaseLine < ApplicationRecord
  scope :with_errors, -> { where("result IS NOT NULL") }
  scope :with_success, -> { where("result IS NULL") }
  belongs_to :import_purchase
  validates :purchaser_name, :item_description, :merchant_address, :merchant_name, presence: true
  validates :item_price, :purchase_count, numericality: true, presence: true


  def import_line(line)
    return false if line.to_s.blank?
    data = line.split(/\t/)
    self.purchaser_name = data[0].to_s
    self.item_description = data[1].to_s
    self.item_price = data[2]
    self.purchase_count = data[3]
    self.merchant_address = data[4].to_s
    self.merchant_name = data[5].to_s
    if self.save
      true
    else
      self.update_attribute(:result, self.errors.full_messages.to_s)
      false
    end
  end
end
