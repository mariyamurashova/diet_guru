FactoryBot.define do
  sequence :title do |n|
    "Product#{n}"
  end

  sequence :brand_name do |n|
    "Brand#{n}"
  end

  factory :product do
    title 
    brand_name 
    calorie { 1 }
    protein { 1 }
    fat { 1 }
    carbohydrate { 1 }
  end
end
