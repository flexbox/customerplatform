class Employees::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @employee = Employee.from_omniauth(request.env["omniauth.auth"])

      if @employee && @employee.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @employee, :event => :authentication
      else
        oauth = request.env["omniauth.auth"].dup
        oauth.delete("extra")

        session["devise.google_data"] = oauth
        redirect_to new_employee_session_url
      end
  end
end
