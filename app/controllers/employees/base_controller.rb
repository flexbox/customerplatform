class Customers::BaseController < ApplicationController
  before_action :authenticate_employee!
end

