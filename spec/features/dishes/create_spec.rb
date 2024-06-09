require 'rails_helper'

feature 'User can add new dish', %q{
  In order to create menu 
  As an authenticated user
  I'd like to be able to add new dish
} do

  given(:user) { create(:user) }
  given!(:products) { create_list(:product, 3) }

   describe 'Authenticated user' do 
    background do
      sign_in(user)
      click_on "My Account"
      click_on "Add new dish"
     
    end

    scenario 'create a dish with valid attributes', js:true do 

      within ".dishes_form" do
        #byebug
        fill_in "Title", with: 'My dish'
        fill_in 'Number of servings', with: '2'
        click_on 'add ingredient'

        within ".nested-fields_create" do
          select("#{products[0].title}", from: "select_ingredient")
          fill_in 'Weight', with: '100'
        end
      end
      click_on 'Save'

      within ".user_dishes" do
        expect(page).to have_content 'My dish'
      end
    end

    scenario "tries to create dish with invalid attributes", js:true do 
      within ".dishes_form" do
        fill_in "Title", with: ''
        fill_in 'Number of servings', with: '2'
        click_on 'add ingredient'
        click_on 'Save'
      end

      within ".errors" do
        expect(page).to have_content "Title can't be blank"
      end
    end
  end
end

