require 'rails_helper'

feature "User can edit dishes's information", %q{
  In order to correct incorrect information in the recipe
  As an authenticated user
  I'd like to be able to edit dish's information 
} do

  given(:user) { create(:user) }

  given!(:product) { create(:product) }
  given!(:dish) { create(:dish, user: user) }
  given!(:dish_ingredient) { create(:dish_ingredient, dish: dish, product: product, weight: 100) }
 
   describe 'Authenticated user' do 
    background do
      sign_in(user)
      click_on "My Account" 
      within '.user_dishes' do
        click_on "#{dish.title}"
      end
    end

    scenario 'can view recipes with energy value information', js:true do
     
      expect(page).to have_content ("#{dish.title} information:")
      expect(page).to have_content ("#{product.protein}")
      expect(page).to have_content ("#{product.fat}")
      expect(page).to have_content ("#{product.carbohydrate}")
    end


    scenario "the dish's author edit receipe with valid attributes", js:true do
   
      within '.dish_info' do
        click_on "edit"
      end

      within ".dishes_form" do
        fill_in "Title", with: 'My dish'
        fill_in 'Number of servings', with: '2'
      end
      click_on 'Save'

      within ".notice" do
         expect(page).to have_content 'the dish has been successfully updated'
      end
      within ".dish_info" do   
        expect(page).to have_content ("My dish information:")
      end
    end

   scenario "the dish's author tries to edit receipe with invalid attributes", js:true do
   
      within '.dish_info' do
        click_on "edit"
      end

      within ".dishes_form" do
        fill_in "Title", with: ''
        fill_in 'Number of servings', with: '2'
      end
      click_on 'Save'

      within ".errors" do
        expect(page).to have_content "Title can't be blank"
      end
      within ".dish_info" do   
        expect(page).to have_content ("#{dish.title} information:")
      end
    end
  end
end
