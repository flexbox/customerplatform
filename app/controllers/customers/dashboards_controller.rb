class Customers::DashboardsController < Customers::BaseController
  def show
    @unit = current_customer.units.first
    @units = current_customer.units
    @news = @unit.building.lot.phase.news.last(5)

    @informations = @unit.information.all

    @timeline = @unit.payments.sort_by(&:id)
    @webcams = @unit.building.lot.phase.project.webcams
    @project = @unit.building.lot.phase.project

    # CONSULTING HOURS WIDGET
    @consultinghours = ConsultingHour.where(customer_id: current_customer)
    @max_consulting = @unit.consulting_hours
    @elapsedhours = calculate_hours(@consultinghours)

    # IMPORTANT WIDGET
    @events = combine_events

    @employee_id = @project.employee_projects.first.employee_id
    @employee = Employee.find(@employee_id)
    @current_page_dashboard = true
  end

private

  def calculate_hours(consultinghours)
    elapsedhours = 0
    consultinghours.each do |consultation|
        elapsedhours += consultation.elapsed_time
      end
    return elapsedhours
  end

  def combine_events
    events = []
    events << @unit.payments.where(status: "pending")
    events << @unit.site_visits
    events << @unit.handovers
    events << @unit.decisions.where(status: "pending")
    return events
  end
end

