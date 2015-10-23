FactoryGirl.define do
  factory :product do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price }
    stock_level { rand 100 }
  end
end
