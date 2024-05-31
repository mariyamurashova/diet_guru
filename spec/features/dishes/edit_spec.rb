require 'rails_helper'

feature "User can add edit dishes's information", %q{
  In order to correct incorrect information in the recipe
  As an authenticated user
  I'd like to be able to edit dish's information 
} do

  given(:user) { create(:user) }
  given!(:products) { create_list(:product, 3, dish: dish) }
  given!(:dish) { create(:dish, user: user) }
  given!(:dish_ingredient) { create(:dish_ingredient, dish: dish, product: product, weight: 100) }


   describe 'Authenticated user' do 
    background do
      sign_in(user)
      click_on "My Account"
    end

  scenario 'can view recipes', js:true do
      within '.user_dishes' do
        click_on "#{dish.title}"
      end

      expect(page).to have_content ("#{dish.title} information:")
    end
end
