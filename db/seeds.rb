require 'date'

customer1 = Customer.create!(

  email: "customer1@gmail.com",
  first_name: "Paul",
  last_name: "Gistelinck",
  address: "Karmstraat 19, 9790 Ooike",
  birthday: Date.new(1990,8,20),
  phone_number: "+32867565675",
  mobile_number: "+337687678676",
  password: "123456",
  signing_date: Date.new(2016,8,20))

customer2 = Customer.create!(

  email: "customer2@gmail.com",
  first_name: "Sandrine",
  last_name: "Bontinckx",
  address: "Emilius Seghersplein 19, 9000 Gent",
  birthday: Date.new(1990,8,20),
  phone_number: "+32867565675",
  mobile_number: "+337687678676",
  password: "123456",
  signing_date: Date.new(2016,8,20))

employee1 = Employee.create!(
  email: "employee1@gmail.com",
  password: "123456",
  first_name: "Josephine",
  last_name: "Decroix",
  )

employee2 = Employee.create!(
  email: "employee2@gmail.com",
  password: "123456",
  first_name: "Luc",
  last_name: "Van De Moortele",
  )


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

phase1 = Phase.create!(
  project_id: project1.id,
  phase_number: 1,
  description: "first phase",
  duration: 2,
  )

phase2 = Phase.create!(
  project_id: project2.id,
  phase_number: 2,
  description: "second phase",
  duration: 1,
  )

lot1 = Lot.create!(
  phase_id: phase1.id,
  lot_number: lot1,
  description: "first lot",
  lot_size: 140,
  )

lot2 = Lot.create!(
  phase_id: phase2.id,
  lot_number: lot2,
  description: "second lot",
  lot_size: 110,
  )

building1 = Building.create!(
  lot_id: lot1.id,
  building_name: "Building1",
  description: "Building in Brugge",
  address: "Blankenbergse Steenweg 343, 8000 Brugge",
  floors: 2,
  shard_space: 100,
  elevator_amount: 1,
  )

building2 = Building.create!(
  lot_id: lot2.id,
  building_name: "Building2",
  description: "Building in Ghent",
  address: "Ottergemsesteenweg 364, 9000 Gent",
  floors: 3,
  shard_space: 50,
  elevator_amount: 2,
  )


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











