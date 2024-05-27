FactoryBot.define do
  factory :dish_ingridient do
    weight { 1.5 }
    dish { association :dish }
    product { association :product }
  end
end
