class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
    employee = where(provider: auth.provider, uid: auth.uid).first
    employee ||= where(email: auth.info.email).first

    if employee
      employee.provider = auth.provider
      employee.uid = auth.uid
      employee.first_name = auth.info.first_name      # assuming the employee model has a name
      employee.last_name = auth.info.last_name        # assuming the employee model has a name
      employee.facebook_picture_url = auth.info.image # assuming the user model has an image

      employee.save
    end

    return employee
  end

  validates :first_name, :last_name, :mobile_number, :picture, presence: true
  validates :mobile_number, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }

  has_many :employee_projects, dependent: :destroy
  has_many :projects, through: :employee_projects

  has_many :consulting_hours, dependent: :destroy
  has_many :customers, through: :consulting_hours

end
