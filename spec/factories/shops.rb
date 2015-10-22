FactoryGirl.define do
  factory :shop do
    name Faker::Company.name
    association :owner, factory: :user
  end
end
