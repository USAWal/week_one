FactoryGirl.define do
  factory :shop do
    name { Faker::Company.name }
    logo { open(Faker::Company.logo) }
    description { Faker::Lorem.paragraph }
    association :owner, factory: :user
  end
end
