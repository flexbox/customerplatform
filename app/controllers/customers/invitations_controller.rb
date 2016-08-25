class Customers::InvitationsController < Devise::InvitationsController
  before_action :disable_creation, only: [:new, :create]

  private

  def disable_creation
    flash[:alert] = "Nice try [418]"
    redirect_to root_path
  end
end
