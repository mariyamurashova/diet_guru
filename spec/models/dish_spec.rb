require 'rails_helper'

RSpec.describe Dish, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:dish_ingredients) }
  it { should have_many(:products).through(:dish_ingredients) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:number_of_servings) }
end
