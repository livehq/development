FactoryGirl.define do
  factory :link do
    url { Faker::Internet.url }
    display { Faker::Lorem.word }
  end
end