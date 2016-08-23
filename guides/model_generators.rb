# ### Initialize roles

  # Customer & Employee already created by Devise but we need to add migration file to add attributes

  rails g model Supplier first_name last_name mobile_number phone_number email company_name logo address


# ### Initialize main 'real estate models'

  rails g model Project commercial_name internal_name description:text coordinates plotsize:integer
  rails g model Phase project:references phase_number:integer description:text duration:integer picture
  rails g model Lot phase:references lot_number description:text picture cadastral_reference lot_size:integer
  rails g model Building lot:references building_name description:text picture address floors:integer shared_space:integer elevator_amount:integer

  # Can we set default values in the generator? Or do we set them in migration file?
  # We need a default value for boolean sold set to false
  # consulting_hours default = 15
  rails g model Unit building:references customer:references unit_name description:text picture address floor_number:integer orientation floor_size:integer sold:boolean price_initial_budget:integer price_contracted:integer land_value:integer construction_value:integer registration_tax_land:integer vat_construction:integer sales_person consulting_hours:integer

  # In ParkingUnit.rb -> belongs_to unit, optional:true because rails needs to know it's optional :)
  rails g model ParkingUnit lot:references unit:references parking_name
  # In StorageUnit.rb -> belongs_to unit, optional:true because rails needs to know it's optional :)
  rails g model StorageUnit building:references unit:references storage_name storage_size:integer

# ### Initialize many-to-many tables

  rails g model EmployeeProject employee:references project:references
  rails g model SupplierProject supplier:references project:references

  # Is this going to work for a situation where a customer buys three units? Or do we add the logic in the controller?
  rails g model ConsultingHour customer:references employee:references elapsed_time:integer description:text

  rails g model Document unit:references file title description:text

# ### Initialize event models

  # We need to set the polymorphic true attribute on references:eventable in the migration file -> see README.md
  # rails g model Event unit:references eventable:references date:date

  # Comment of Marc: set to phase instead of project
  rails g model News phase:references title description:text picture date:date
  rails g model Decision unit:references supplier:references title document:references description:text date:date due_date:date
  rails g model Handover unit:references document:references title description:text date:date
  # Set default value for boolean accepted to false
  rails g model Information unit:references title document:references description:text read:boolean date:date
  rails g model SiteVisit unit:references title description:text date:date
  rails g model Payment unit:references name document:references description:text amount:integer status

  # Adding doc_id as a ref to site visits
  rails g migration AddDocumentRefToSiteVisits document:references

  # Adding appoved to decisions
  rails g migration AddApprovedToDecisions approved:boolean

  # Remove coordinates from projects
  rails g migration RemoveCoordinatesFromProjects coordinates:string

  # add longitude and latitude to projects (to be able to use GeoCoding)
  rails g migration AddLongitudeToProjects longitude:float

  # add missing fields to Employees
  rails g migration AddFirstNameToEmployees first_name
  rails g migration AddLastNameToEmployees last_name
  rails g migration AddMobileNumberToEmployees mobile_number
  rails g migration AddTitleToEmployees title
  rails g migration AddPictureToEmployees picture

  # add missing fields to Customer
  rails g migration AddFirstNameToCustomers first_name
  rails g migration AddLastNameToCustomers last_name
  rails g migration AddMobileNumberToCustomers mobile_number
  rails g migration AddAddressToCustomers address
  rails g migration AddBirthdayToCustomers birthday:date
  rails g migration AddPhoneNumberToCustomers phone_number
  rails g migration AddIbanToCustomers iban
  rails g migration AddWelcomeBoxToCustomers welcome_box
  rails g migration AddNotesToCustomers notes:text
  rails g migration AddUsedHoursToCustomers used_hours:integer
  rails g migration AddSigningDateToCustomers signing_date:date
  rails g migration AddDeedDateToCustomers deed_date:date
  rails g migration AddPictureToCustomers picture
