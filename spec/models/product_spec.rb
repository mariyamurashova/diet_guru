require 'rails_helper'

RSpec.describe Product, type: :model do
 it { should validate_presence_of(:title) }
 it { should validate_presence_of(:brand_name) }
 it { should validate_presence_of(:calorie) }
 it { should validate_presence_of(:protein) }
 it { should validate_presence_of(:fat) }
 it { should validate_presence_of(:carbohydrate) }
 it { should have_many(:dish_ingredients) }
 it { should have_many(:dishes).through(:dish_ingredients) }

end
