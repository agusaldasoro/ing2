FactoryGirl.define do
  factory :characteristic do
  end

  factory :address, class: Address, parent: :characteristic do
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    value { Faker::Address.street_address }
  end

  factory :has_wifi, class: HasWifi, parent: :characteristic do
    value 'true'
  end

  factory :email, class: Email, parent: :characteristic do
    value { Faker::Internet.email }
  end

  factory :close_time, class: CloseTime, parent: :characteristic do
    value { "#{Faker::Number.between(12, 24)}:#{Faker::Number.between(0, 59)}" }
  end

  factory :opening_time, class: OpeningTime, parent: :characteristic do
    value { "#{Faker::Number.between(0, 12)}:#{Faker::Number.between(0, 59)}" }
  end

  factory :phone_number, class: PhoneNumber, parent: :characteristic do
    value { Faker::PhoneNumber.cell_phone }
  end

  factory :web_page, class: WebPage, parent: :characteristic do
    value { Faker::Internet.url('example.com') }
  end

  factory :plug_quantity, class: PlugQuantity, parent: :characteristic do
    value { Faker::Number.between(1, 100) }
  end

  factory :capacity, class: Capacity, parent: :characteristic do
    value { Faker::Number.between(5, 400) }
  end

  factory :average_price, class: AveragePrice, parent: :characteristic do
    value { Faker::Number.decimal(3, 2) }
  end
end
