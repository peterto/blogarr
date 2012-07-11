# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title Faker::Lorem.word
    content Faker::Lorem.sentence
  end
end