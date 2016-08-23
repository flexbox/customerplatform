class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |employee|
      employee.email = auth.info.email
      employee.password = Devise.friendly_token[0,20]
      employee.first_name = auth.info.first_name   # assuming the employee model has a name
      employee.last_name = auth.info.last_name   # assuming the employee model has a name
      employee.facebook_picture_url = auth.info.image # assuming the user model has an image
    end
  end

end
