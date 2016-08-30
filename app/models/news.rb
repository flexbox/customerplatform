class News < ApplicationRecord

  mount_uploader :picture, PhotoUploader

  validates :phase_id, :title, :description, :date, presence: true
  validates :title, uniqueness: { case_sensitive: false }

  belongs_to :phase
end
