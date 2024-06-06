require 'rails_helper'
RSpec.describe EnergyValueService do
    describe 'find_ingredients' do  
    let!(:totals_test) { { total_calories: product.calorie*dish_ingredient.weight/100, 
                        total_proteins: product.protein*dish_ingredient.weight/100, 
                        total_fats:product.fat*dish_ingredient.weight/100, 
                        total_carbohydrates:product.carbohydrate*dish_ingredient.weight/100 }}
                        
    let!(:dish) { create(:dish) }
    let!(:product) { create(:product) }
    let!(:dish_ingredient) { create(:dish_ingredient, product: product, dish: dish ) }
    let!(:subject) { EnergyValueService.new(dish) }
    let!(:ingredients_info_test) { {product.title => {weight: dish_ingredient.weight, 
                                                      calories: product.calorie, 
                                                      proteins: product.protein, 
                                                      fats: product.fat,  
                                                      carbohydrates: product.carbohydrate}}}
    
    it "returns dish's ingredients" do
      expect(subject.find_ingredients).to include(dish_ingredient)
    end

    it "returns calculates dish's energy value" do
      subject.calculate
      expect(subject.ingredients_info).to eq(ingredients_info_test)
      expect(subject.totals).to eq(totals_test)
    end
  end
end 
