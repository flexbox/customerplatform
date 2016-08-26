class Customers::ProfilesController < ApplicationController

  def show
    @user = current_customer
  end

  def edit
    @user = current_customer
  end

  def update
    @user = current_customer
    @user.update(params.require(:customer).permit(:email, :password, :password_confirmation, :phone_number, :mobile_number, :address))
    redirect_to root_path
  end


end
