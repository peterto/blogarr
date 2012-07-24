# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    post_id 1
    tag_name Faker::Lorem.word
  end
end
