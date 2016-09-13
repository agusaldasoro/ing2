FactoryGirl.define do
  factory :bar do
    name   { Faker::Name.title }
    wifi   { true }
  end
end
