class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :address, :mobile_number, :email, :signing_date, presence: true
  validates :mobile_number, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }

  has_many :consulting_hours, dependent: :destroy
  has_many :employees, through: :consulting_hours

  # beware here : although a customer has units,
  # destroying a customer should not destroy the
  # units he's bought. units.customer_id should be
  # set to nil
  has_many :units, dependent: :nullify

end
