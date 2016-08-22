# Guides

## STI VS kind column VS several tables

### STI

```ruby
## STI: overview

# app/models/event.rb
class Event < ApplicationRecord
  belongs_to :unit
end

# app/models/decision_event.rb
class DecisionEvent < Event
end

# app/models/acceptance_event.rb
class AcceptanceEvent < Event
end

class InstalmentEvent < Event
  has_many :payments
end

# table
create_table :events do |t|
  # common
  t.string :title
  t.date :date

  # decision


  t.string :type # STI: Single Table Inheritance
  t.references :unit
end

DecisionEvent.create(title: "Plop", date: Date.today, unit: unit)
# INSERT INTO events (title, date, unit, type) VALUES ('Plop', '2016-08-22', unit_id: 2, type: 'DecisionEvent')

DecisionEvent.all
Event.all
```

### kind column

```ruby
class Product < ApplicationRecord
  validates :kind, inclusion: { in: ['plant', 'bouquet'] }
end

Product.all
Product.where(kind: 'plant')
```

### Several tables WITH polymorphic

```ruby
class Decision < ApplicationRecord
  belongs_to :unit
  has_one :event, as: :eventable
end

class Payment < ApplicationRecord
  belongs_to :unit
  has_one :event, as: :eventable
end

class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true
end

create_table :events do |t|
  t.references :unit
  t.date :date
  t.references :eventable, polymorphic: true
end
```

Generated table:

- id
- date
- eventable_id (integer)
- eventable_type (string)
- unit_id (integer)

Example of data:

| ID | date       | unit_id  | eventable_id | eventable_type |
| -- | ---------- | -------- | ------------ | -------------- |
| 1  | 2016-07-22 | 1        | 1            | Decision       |
| 2  | 2016-07-24 | 1        | 1            | Payment        |
