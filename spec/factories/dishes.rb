FactoryBot.define do
  factory :dish do
    title { "MyString" }
    number_of_servings { 1 }
    user { association :user }
  end
end
