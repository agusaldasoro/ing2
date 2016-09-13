FactoryGirl.define do
  factory :location do
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    address { Faker::Address.street_address }
  end
end
