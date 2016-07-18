FactoryGirl.define do
  factory :user do
    email 'myself@example.com'
    password 'gibberishdotcom'
    password_confirmation 'gibberishdotcom'
  end
end
