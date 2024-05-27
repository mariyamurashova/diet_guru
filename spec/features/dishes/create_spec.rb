require 'rails_helper'

feature 'User can add product', %q{
  In order to create menu or a dish
  As an authenticated user
  I'd like to be able to add new product
} do

  given(:user) { create(:user) }

  describe 'Authenticated user' do 
    background do
      sign_in(user)
      click_on "My Account"
      click_on "Add new product"
   
      fill_in 'Title', with: 'product_title'
      fill_in 'Тumber of servings', with: '2'
      fill_in 'Ingridient', with: 'chicken'
      fill_in 'Weight', with: '100'
      click_on 'Add Ingridient'

      fill_in 'Ingridient', with: 'onion'
      fill_in 'Weight', with: '100'
    end

    scenario 'adds a dish' do 
      click_on 'Save'
      expect(page).to have_content 'the new dish has been successfully created'
    end

    scenario "doesn't add a product" do 
    end
  end
end
