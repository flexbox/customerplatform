class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_unit, if: :customer_signed_in?

  private

  def set_unit
    if params[:unit_id]
      @unit = current_customer.units.find(params[:unit_id])
    else
      @unit = current_customer.units.first
    end
  end
end
