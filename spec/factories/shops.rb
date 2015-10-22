FactoryGirl.define do
  factory :shop do
    association :owner, factory: :user
  end
end
