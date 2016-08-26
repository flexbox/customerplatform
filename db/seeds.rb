require 'date'


#Destroy -----------------------------------------------------------------------

Decision.destroy_all
ConsultingHour.destroy_all
Handover.destroy_all
Information.destroy_all
News.destroy_all
Payment.destroy_all
SiteVisit.destroy_all

StorageUnit.destroy_all
ParkingUnit.destroy_all

SupplierProject.destroy_all
EmployeeProject.destroy_all

Document.destroy_all

Unit.destroy_all
Building.destroy_all
Lot.destroy_all
Phase.destroy_all
Project.destroy_all

Customer.destroy_all
Employee.destroy_all
Supplier.destroy_all

Document.destroy_all


#seed Customers ----------------------------------------------------------------

customer1 = Customer.create!(

  email: "customer1@gmail.com",
  first_name: "Paul",
  last_name: "Gistelinck",
  address: "Karmstraat 19, 9790 Ooike",
  birthday: Date.new(1990,8,20),
  phone_number: "+32867565675",
  mobile_number: "+337687678676",
  password: "123456",
  signing_date: Date.new(2016,8,20),
  picture: "pictures/man1.jpg"

)

customer2 = Customer.create!(

  email: "customer2@gmail.com",
  first_name: "Sandrine",
  last_name: "Bontinckx",
  address: "Emilius Seghersplein 19, 9000 Gent",
  birthday: Date.new(1990,8,20),
  phone_number: "+32867565677",
  mobile_number: "+337687678678",
  password: "123456",
  signing_date: Date.new(2016,8,20),
  picture: "pictures/man2.jpg"
)


#seed Employees ----------------------------------------------------------------

employee1 = Employee.create!(
  email: "employee1@gmail.com",
  password: "123456",
  first_name: "Josephine",
  last_name: "Decroix",
  mobile_number: "+32789258441",
  picture: "woman2.jpg"
)

employee2 = Employee.create!(
  email: "employee2@gmail.com",
  password: "123456",
  first_name: "Luc",
  last_name: "Van De Moortele",
  mobile_number: "+32789258442",
  picture: "man3.jpg"
)

employee3 = Employee.create!(
  email: "yannick@re-vive.re",
  password: "123456",
  first_name: "Yannick",
  last_name: "Bontinckx",
  mobile_number: "+3278925662",
  picture: "man3.jpg"
)

employee4 = Employee.create!(
  email: "marc.francis.mail@gmail.com",
  password: "123456",
  first_name: "Marc",
  last_name: "Francis",
  mobile_number: "+3200000000",
  picture: "man3.jpg"
)

employee5 = Employee.create!(
  email: "gistelinckpieter@gmail.com",
  password: "123456",
  first_name: "Pieter",
  last_name: "Gistelinck",
  mobile_number: "+320002992929",
  picture: "man3.jpg"
)

employee6 = Employee.create!(
  email: "pvhammerstein@gmail.com",
  password: "123456",
  first_name: "Philipp",
  last_name: "von Hammerstein",
  mobile_number: "+3255555555",
  picture: "man3.jpg"
)



#seed Suppliers ----------------------------------------------------------------

supplier1 = Supplier.create!(
  first_name: "Nick",
  last_name: "Van Marcke",
  mobile_number: "+337687678679",
  phone_number: "458555555555",
  email: "supplier1@gmail.com",
  company_name: "Van Marcke",
  address: "Turnhoutste steenweg 242 Kortrijk"
  )

supplier2 = Supplier.create!(
  first_name: "Cedric",
  last_name: "Overijse",
  mobile_number: "+337687678680",
  phone_number: "458555555556",
  email: "supplier2@gmail.com",
  company_name: "Overijse en zoon",
  address: "Kantijnlaan 13 Brugge",
  )


#seed Projects ----------------------------------------------------------------

project1 = Project.create!(
  commercial_name: "Den Indruk",
  internal_name: "Brugge1",
  description: "new project Brugge 2015",
  plotsize: 5000,
  longitude: 3.224200,
  latitude: 51.235224,
)

project2 = Project.create!(
  commercial_name: "Kadox",
  internal_name: "Ghent1",
  description: "new project Ghent 2008",
  plotsize: 4000,
  longitude: 3.696797,
  latitude: 51.072414,
)


#seed Phases ------------------------------------------------------------------

phase1 = Phase.create!(
  project_id: project1.id,
  phase_number: 1,
  description: "first phase",
  duration: 2,
  picture: "phase.jpg"
)

phase2 = Phase.create!(
  project_id: project2.id,
  phase_number: 2,
  description: "second phase",
  duration: 1,
  picture: "phase.jpg"
)


#seed Lots ---------------------------------------------------------------------

lot1 = Lot.create!(
  phase_id: phase1.id,
  lot_number: 1,
  description: "first lot",
  lot_size: 140,
)

lot2 = Lot.create!(
  phase_id: phase2.id,
  lot_number: 1,
  description: "second lot",
  lot_size: 110,
)


#seed Buildings ----------------------------------------------------------------

building1 = Building.create!(
  lot_id: lot1.id,
  building_name: "Building1",
  description: "Building in Brugge",
  address: "Blankenbergse Steenweg 343, 8000 Brugge",
  floors: 2,
  shared_space: 100,
  elevator_amount: 1,
)

building2 = Building.create!(
  lot_id: lot2.id,
  building_name: "Building2",
  description: "Building in Ghent",
  address: "Ottergemsesteenweg 364, 9000 Gent",
  floors: 3,
  shared_space: 50,
  elevator_amount: 2,
)


#seed Units -------------------------------------------------------------------

unit1 = Unit.create!(
  building_id: building1.id,
  customer_id: customer1.id,
  unit_name: "unit1.1",
  description: "this is unit1",
  address: "Morekstraat 314, 9032 Gent",
  floor_number: 1,
  orientation: "South",
  floor_size: 100,
  sold: false,
  price_contracted: 300_000,
  sales_person: "Dirk Dewachter"
)

unit2 = Unit.create!(
  building_id: building2.id,
  customer_id: customer2.id,
  unit_name: "unit2.1",
  description: "this is unit2",
  address: "Elisabeth Zorghestraat 4",
  floor_number: 1,
  orientation: "East",
  floor_size: 100,
  sold: false,
  price_contracted: 300_000,
  sales_person: "Dirk Dewachter"
)


#seed Storage Units ------------------------------------------------------------

storage_unit1 = StorageUnit.create!(
  building_id: building1.id,
  storage_name: "storage1",
  storage_size: 5,
  unit_id: unit1.id,
  )

storage_unit2 = StorageUnit.create!(
  building_id: building2.id,
  storage_name: "storage2",
  storage_size: 7,
  unit_id: unit2.id,
  )


#seed Parking Units ------------------------------------------------------------

parking_unit1 = ParkingUnit.create!(
  lot_id: lot1.id,
  unit_id: unit1.id,
  parking_name: "Parking 1",
  )

parking_unit2 = ParkingUnit.create!(
  lot_id: lot2.id,
  unit_id: unit2.id,
  parking_name: "Parking 2",
  )


#seed Employee_projects---------------------------------------------------------

employee_project1 = EmployeeProject.create!(
  employee_id: employee1.id,
  project_id: project1.id,
)

employee_project2 = EmployeeProject.create!(
  employee_id: employee2.id,
  project_id: project2.id,
)

#seed Employee_projects---------------------------------------------------------

supplier_project1 = SupplierProject.create!(
  supplier_id: supplier1.id,
  project_id: project1.id,
)

supplier_project2 = SupplierProject.create!(
  supplier_id: supplier2.id,
  project_id: project2.id,
)


#seed Documents-----------------------------------------------------------------

document1 = Document.create!(
  unit_id: unit1.id,
  title: "PDF map",
  description: "This is the PDF map",
  file: "revive.pdf",
  kind: "Manual"
)

document2 = Document.create!(
  unit_id: unit1.id,
  title: "offer",
  description: "This is an offer",
  file: "sample.pdf",
  kind: "Official"

)

document3 = Document.create!(
  unit_id: unit2.id,
  title: "PDF map",
  description: "This is the PDF map",
  file: "revive.pdf",
  kind: "Invoice"
)

document4 = Document.create!(
  unit_id: unit2.id,
  title: "offer",
  description: "This is an offer",
  file: "sample.pdf",
  kind: "Manual"
)

#seed Decisions-----------------------------------------------------------------

decision1 = Decision.create!(
  unit_id: unit1.id,
  supplier_id: supplier1.id,
  title: "meeting with first supplier",
  description: "very urgent",
  date: Date.new(2016,8,22),
  due_date: Date.new(2016,9,22),
  status: "pending",
  document_id: document1.id,
)

decision2 = Decision.create!(
  unit_id: unit1.id,
  supplier_id: supplier2.id,
  title: "meeting with second supplier",
  description: "very very urgent",
  date: Date.new(2016,8,22),
  due_date: Date.new(2016,9,22),
  status: "pending",
  document_id: document2.id,
)

decision3 = Decision.create!(
  unit_id: unit2.id,
  supplier_id: supplier1.id,
  title: "meeting with first supplier",
  description: "urgent",
  date: Date.new(2016,8,24),
  due_date: Date.new(2016,9,26),
  status: "pending",
  document_id: document3.id,
)

decision3 = Decision.create!(
  unit_id: unit2.id,
  supplier_id: supplier2.id,
  title: "meeting with second supplier",
  description: "urgent",
  date: Date.new(2016,8,24),
  due_date: Date.new(2016,9,26),
  status: "pending",
  document_id: document4.id,
)


#seed Consulting hours----------------------------------------------------------

consulting_hours1 = ConsultingHour.create!(
  customer_id: customer1.id,
  employee_id: employee1.id,
  elapsed_time: 2,
  description: "first consultation",
)

consulting_hours2 = ConsultingHour.create!(
  customer_id: customer2.id,
  employee_id: employee2.id,
  elapsed_time: 3,
  description: "fourth consultation",
)


#seed Handovers-----------------------------------------------------------------

handover1 = Handover.create!(
  unit_id: unit1.id,
  document_id: document1.id,
  title: "handover customer",
  description: "the first handover for this customer",
  date: Date.new(2017,10,22),
)

handover2 = Handover.create!(
  unit_id: unit2.id,
  document_id: document2.id,
  title: "handover customer",
  description: "the first handover for this customer",
  date: Date.new(2017,10,22),
)


#seed Information----------------------------------------------------------------

information1 = Information.create!(
  unit_id: unit1.id,
  title: "Information about first floor",
  document_id: document1.id,
  description: "Welcome to your new house",
  read: false,
  date: Date.new(2016,8,29),
)

information2 = Information.create!(
  unit_id: unit2.id,
  title: "Information about the garden",
  document_id: document2.id,
  description: "Welcome to your new garden",
  read: false,
  date: Date.new(2016,8,29),
)


#seed News---------------------------------------------------------------------

# seed News for phase 1 -------------------------------------------------------
News.create!(
  phase_id: phase1.id,
  title: "Revive is welcoming Nick!",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi unde laudantium ratione sequi tempora ipsam eveniet, reprehenderit quia accusantium necessitatibus magni incidunt facilis dolores ullam tenetur, cumque, sunt modi. Adipisci.",
  date: Date.new(2016,8,10),
  picture: "sample.jpg"
)

News.create!(
  phase_id: phase1.id,
  title: "We received the first price!",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa delectus reiciendis doloribus corporis suscipit sunt dolorem facilis maiores, commodi sequi, molestias odit voluptatem, minus omnis quos. Facere, neque quod voluptas.",
  date: Date.new(2016,8,18),
)

News.create!(
  phase_id: phase1.id,
  title: "New building permit",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa delectus reiciendis doloribus corporis suscipit sunt dolorem facilis maiores, commodi sequi, molestias odit voluptatem, minus omnis quos. Facere, neque quod voluptas.",
  date: Date.new(2016,8,20),
  picture: "sample.jpg"
)

News.create!(
  phase_id: phase1.id,
  title: "Re-Vive wins project Oude Dokken Ghent",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa delectus reiciendis doloribus corporis suscipit sunt dolorem facilis maiores, commodi sequi, molestias odit voluptatem, minus omnis quos. Facere, neque quod voluptas.",
  date: Date.new(2016,8,12),
)

News.create!(
  phase_id: phase1.id,
  title: "New date for opening public park",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa delectus reiciendis doloribus corporis suscipit sunt dolorem facilis maiores, commodi sequi, molestias odit voluptatem, minus omnis quos. Facere, neque quod voluptas.",
  date: Date.new(2016,8,8),
  picture: "sample.jpg"
)

# seed News for phase 1 -------------------------------------------------------
news2 = News.create!(
  phase_id: phase2.id,
  title: "Revive is welcoming Jan!",
  description: "Our newest employee",
  date: Date.new(2016,8,12),
  picture: "news2.jpg"
)


#seed Payments------------------------------------------------------------------

payment1 = Payment.create!(
  unit_id: unit1.id,
  name: "first payment",
  document_id: document1.id,
  description: "first payment of the house",
  amount: 50_000,
  status: "pending",
  due_date: Date.new(2016,8,22),
)

payment2 = Payment.create!(
  unit_id: unit2.id,
  name: "last payment",
  document_id: document2.id,
  description: "last payment of the house",
  amount: 60_000,
  status: "pending",
  due_date: Date.new(2016,8,22),
)


#seed Site Visits---------------------------------------------------------------

site_visit1 = SiteVisit.create!(
  unit_id: unit1.id,
  title: "Visit your home",
  description: "We welcome you to have a look at your home",
  date: Date.new(2016,9,21),
  )

site_visit2 = SiteVisit.create!(
  unit_id: unit2.id,
  title: "Visit your parking lot",
  description: "We welcome you to have a look at your parking lot",
  date: Date.new(2016,10,21),
  )

