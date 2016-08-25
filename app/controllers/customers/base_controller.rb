class Customers::BaseController < ApplicationController
  before_action :set_unit, if: :customer_signed_in?
  before_action :authenticate_customer!
  layout "customer"

  private

  def set_unit
    if params[:unit_id]
      @unit = current_customer.units.find(params[:unit_id])
    else
      @unit = current_customer.units.first
    end
  end
end
