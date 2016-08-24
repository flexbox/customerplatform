class Document < ApplicationRecord

  validates :unit_id, :file, :title, presence: true

  belongs_to :unit

end
