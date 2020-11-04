FactoryBot.define do
  factory :user do
    name { "testman" }
    sequence(:email) { |n| "testman#{n}@example.com" }
    password { "password" }
  end
end
