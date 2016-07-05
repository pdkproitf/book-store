require 'faker'

FactoryGirl.define do
  factory :publish do
    name { Faker::Name.name }
  end
end
