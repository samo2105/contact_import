class CsvFile < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :user_id, :file, :state,  :order, presence: true
  enum state: [:on_hold, :processing, :failed, :finished]
  validate :correct_file_mime_type
  validate :order_verification

  private

  def correct_file_mime_type
    errors.add(:file, 'File must be CSV format') if file.attached? && !file.content_type.in?(%w(application/csv text/csv))
  end

  def order_verification
    errors.add(:order, 'Fields must be unique per csv') if !order.uniq.length == order.length
  end
end
