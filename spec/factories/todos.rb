# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo do
    title { Faker::Lorem.sentence(2) }
    is_completed false
  end
end
