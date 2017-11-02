class ImportPurchase < ApplicationRecord
  belongs_to :user
  validates :user_id, :status, presence: true
  # validates :import_file, attachment_presence: true

  has_attached_file :import_file
end
