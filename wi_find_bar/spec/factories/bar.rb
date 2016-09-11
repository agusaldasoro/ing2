FactoryGirl.define do
  factory :bar do
    address { Faker::Address.street_address }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    wifi true
  end
end
