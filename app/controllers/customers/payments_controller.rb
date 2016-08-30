class Customers::PaymentsController < Customers::BaseController
  def index
    @payments = current_customer.units.first.payments
    @pending = pending(@payments)
    @completed = completed(@payments)
    @future_payments = future_payments(@payments)
    @current_page_payments = true
  end

  def show
  end

  private

#method for calculating total pending-------------------------------------------
   def pending(payments)
    pending = 0
    payments.each do |payment|
      if payment.status == "pending"
      pending += payment.amount
      end
    end
    return pending
  end

#method for calculating total completed-----------------------------------------

    def completed(payments)
    completed = 0
    payments.each do |payment|
      if payment.status == "completed"
      completed += payment.amount
      end
    end
    return completed
  end

#method for calculating total future_payments-----------------------------------------
#
    def future_payments(payments)
    future_payments = 0
    payments.each do |payment|
      if payment.status == "future payment"
      future_payments += payment.amount
      end
    end
    return future_payments
  end

end
