require 'rails_helper'

RSpec.describe Dish, type: :model do
  it { should have_many(:dish_ingredients) }
  it { should have_many(:products).through(:dish_ingredients) }
end
