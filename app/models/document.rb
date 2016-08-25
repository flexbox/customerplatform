class Document < ApplicationRecord

  validates :unit_id, :file, :title, :kind, presence: true

  belongs_to :unit

end
