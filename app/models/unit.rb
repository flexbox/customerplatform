class Unit < ApplicationRecord

  mount_uploader :picture, PhotoUploader

  validates :building_id, :unit_name, :floor_number, :floor_size, :price_contracted, :sales_person, presence: true
  validates_uniqueness_of :building_id, :scope => [:unit_name]

  belongs_to :building
  belongs_to :customer, optional: true # we have a dependent: :nullify at customer side
                       # so deleting a customer sets customer_id to nil
                       # but does not delete the unit
  has_many :documents, dependent: :destroy
  has_many :decisions, dependent: :destroy
  has_many :handovers, dependent: :destroy
  has_many :information, dependent: :destroy # information plural = information
                                             # -> no 's' at the end
  has_many :site_visits, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :helpdesk_tickets, dependent: :destroy

end
