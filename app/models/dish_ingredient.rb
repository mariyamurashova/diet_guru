class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :product

  validates :product, uniqueness: { scope: :dish,
    message: "your dish aleady includes this product" }

  scope :get_ingredient_weight, ->(dish, product) { where(:dish_id== dish.id && :product_id==product.id).first.weight }

  def self.hash_ingredients_weights(dish)
    hash = []
    dish.products.each do |product| 
      hash["#{product.title}"] =  DishIngredient.get_ingredient_weight(dish, product)
    end
  end
   
end
