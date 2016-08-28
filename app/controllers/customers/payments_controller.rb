class Customers::PaymentsController < Customers::BaseController
  def index
    @payments = current_customer.units.first.payments
    @pending = pending(@payments)
    @completed = completed(@payments)
    @future_payment = future_payments(@payments)
  end

  def show
  end

  private

   def pending(payments)
    pending = 0
    payments.each do |payment|
      if payment.status == "pending"
      pending += payment.amount
      end
    end
    return pending
  end

    def completed(payments)
    completed = 0
    payments.each do |payment|
      if payment.status == "completed"
      completed += payment.amount
      end
    end
    return pending
  end

    def future_payments(payments)
    future_payments = 0
    payments.each do |payment|
      if payment.status == "future_payment"
      future_payments += payment.amount
      end
    end
    return future_payments
  end

end
