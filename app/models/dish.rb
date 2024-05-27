class Dish < ApplicationRecord
  has_many :dish_ingredients, dependent: :destroy
  has_many :products, through: :dish_ingredients

  accepts_nested_attributes_for :dish_ingredients, reject_if: :all_blank, allow_destroy: true
end
