FactoryGirl.define do
  factory :bar do
    name { Faker::Name.title }
  end
end
