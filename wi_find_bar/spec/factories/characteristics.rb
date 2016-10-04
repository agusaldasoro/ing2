FactoryGirl.define do
  factory :characteristic do
  end

  factory :has_wifi, class: HasWifi, parent: :characteristic do
    value 'true'
  end

  factory :address, class: Address, parent: :characteristic do
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    value { Faker::Address.street_address }
  end

  factory :plug_quantity, class: PlugQuantity, parent: :characteristic do
    value { Faker::Number.between(1, 100) }
  end
end
