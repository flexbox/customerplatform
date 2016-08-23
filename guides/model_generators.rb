# ### Initialize roles

  # Customer & Employee already created by Devise but we need to add migration file to add attributes

  rails g model Supplier first_name last_name mobile_number phone_number email company_name logo address


# ### Initialize main 'real estate models'

  rails g model Product commercial_name internal_name description:text coordinates plotsize:integer
  rails g model Phase references:project phase_number:integer description:text duration:integer picture
  rails g model Lot references:phase lot_number description:text picture cadastral_reference lot_size:integer
  rails g model Building references:lot building_name description:text picture address floors:integer shared_space:integer elevator_amount:integer

  # Can we set default values in the generator? Or do we set them in migration file?
  # We need a default value for boolean sold set to false
  rails g model Unit references:building references:customer unit_name description:text picture address floor_number:integer orientation floor_size:integer sold:boolean price_initial_budget:integer price_contracted:integer land_value:integer construction_value:integer registration_tax_land:integer vat_construction:integer sales_person

  # In ParkingUnit.rb -> belongs_to unit, optional:true because rails needs to know it's optional :)
  rails g model ParkingUnit references:lot references:unit parking_name
  rails g model StorageUnit references:building references:unit storage_name storage_size:integer

# ### Initialize many-to-many tables

  rails g model EmployeeProject references:employee references:project
  rails g model SupplierProject references:supplier references:project

  # Is this going to work for a situation where a customer buys three units? Or do we add the logic in the controller?
  rails g model ConsultingHour references:customer references:employee elapsed_time:integer description:text

  rails g model Document references:unit file description:text

# ### Initialize event models

  # We need to set the polymorphic true attribute on references:eventable in the migration file -> see README.md
  rails g model Event references:unit references:eventable date:date

  # Comment of Marc: set to phase instead of project
  rails g model News references:phase title description:text picture
  rails g model Decision references:unit references:supplier title description:text
  rails g model Acceptance references:unit title description:text date:date
  # Set default value for boolean accepted to false
  rails g model Information references:unit title description:text accepted:boolean
  rails g model SiteVisit references:unit title description:text date:date
  rails g model Payment references:unit name description:text amount:integer status
