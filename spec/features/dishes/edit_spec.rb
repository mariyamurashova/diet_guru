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
    end

  scenario 'can view recipes', js:true do
      within '.user_dishes' do
        click_on "#{dish.title}"
      end

      expect(page).to have_content ("#{dish.title} information:")
    end
  end

  scenario "the dish's author can edit receipe", js:true do
    click_on "#{dish.title}"
    click_on "Edit"

    within ".dishes_form" do
      fill_in "Dish Title", with: 'My dish'
      fill_in 'Number of servings', with: '2'
      click_on 'add ingredient'

      within ".nested-fields" do
        select("#{products[0].title}", from: "select_ingredient")
        fill_in 'Weight', with: '100'
      end
    end
      click_on 'Save'

      within ".user_dishes" do
        expect(page).to have_content 'Your receipe was successfully updated'
      end


  end

end
