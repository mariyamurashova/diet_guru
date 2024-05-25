class Product < ApplicationRecord
  validates_presence_of :title, :calorie, :protein, :fat, :carbohydrate, :brand_name
  validates_uniqueness_of :title, scope: :brand_name, message: "this product already exists"
end
