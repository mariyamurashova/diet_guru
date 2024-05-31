class EnergyValueService

  attr_reader :ingredients_info, :totals

  def initialize(dish)
    @totals = {total_calories: 0, total_proteins: 0, total_fats:0, total_carbohydrates:0 }
    @ingredients_info = { }
    @dish = dish
  end

  def find_ingredients
    DishIngredient.joins(:product).where(dish_id:@dish.id)
  end

  def calculate
    self.find_ingredients.each do |ingred| 
      product = Product.find(ingred.product_id)
      @ingredients_info[product.title] = { weight: ingred.weight, calories: product.calorie, proteins: product.protein, fats: product.fat,  carbohydrates: product.carbohydrate }

      @totals[:total_calories] = @totals[:total_calories] + ((product.calorie*ingred.weight/100)/@dish.number_of_servings)
      @totals[:total_proteins] =  @totals[:total_proteins] + ((product.protein*ingred.weight/100)/@dish.number_of_servings)
      @totals[:total_fats] =  @totals[:total_fats] + ((product.fat*ingred.weight/100)/@dish.number_of_servings)
      @totals[:total_carbohydrates] =  @totals[:total_carbohydrates] + ((product.carbohydrate*ingred.weight/100)/@dish.number_of_servings)
    end
  end
end
