class Dish < ApplicationRecord
  has_many :dish_ingredients, dependent: :destroy
  has_many :products, through: :dish_ingredients
  belongs_to :user
  accepts_nested_attributes_for :dish_ingredients, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :title, :number_of_servings

end
