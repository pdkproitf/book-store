require 'faker'

FactoryGirl.define do
  factory :comment do
    user_id { Faker::Number.number(2) }
    book_id { Faker::Number.number(2) }
    desc { Faker::Lorem.word }
    date { Faker::Time.backward(5, :evening) }
  end

  factory :invalid_comment, parent: :comment do
    book_id nil
    user_id nil
    desc nil
  end

end
