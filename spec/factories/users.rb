FactoryBot.define do
   sequence :email do |n|
    "user#{n}@test.com" 
  end

  factory :user do
    first_name { "Ivan" }
    last_name { "Ivanov" }
    email 
    password {"111111"}
    date_of_birth { "1990-05-04 00:03:22" }
    current_weight { 96.0 }
    target_weight { 85.0 }
  end
end
