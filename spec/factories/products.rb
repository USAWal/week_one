FactoryGirl.define do
  factory :product do
    title Faker::Commerce.product_name
  end
end
