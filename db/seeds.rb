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









