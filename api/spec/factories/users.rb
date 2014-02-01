FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { "#{Faker::Number.number(8)}-#{Faker::Internet.email}" }
    password { "#{Faker::Internet.password}#{Faker::Number.number(8)}" }
  end
end