FactoryGirl.define do
  factory :shop do
    name { Faker::Company.name }
    logo { open(Faker::Company.logo) }
    description { Faker::Lorem.paragraph 20 }
    association :owner, factory: :user
  end
end
