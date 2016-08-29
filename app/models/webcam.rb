class Webcam < ApplicationRecord
  validates :project_id, :title, :url, presence: true

  belongs_to :project
end
