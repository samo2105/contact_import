class CsvFile < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  validates :user_id, :file, :state,  :order, presence: true
  enum state: [:on_hold, :processing, :failed, :finished]
  validate :correct_file_mime_type

  private

  def correct_file_mime_type
    errors.add(:file, 'File must be CSV format') if file.attached? && !file.content_type.in?(%w(application/csv))
  end
end
