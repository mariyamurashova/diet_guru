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
    end

    scenario 'adds a product', js:true do 
      
    
       within ".products_form" do
      fill_in "Title", with: 'product_title'
      fill_in 'Brand name', with: 'brand_name'
      fill_in 'Calorie', with: '100'
      fill_in 'Protein', with: '5'
      fill_in 'Carbohydrate', with: '6'
      fill_in 'Fat', with: '7' 
      click_on 'Save Product'
    end
      expect(page).to have_content 'the new product has been successfully created'
    end

    scenario "doesn't add a product" do 
       within ".products_form" do
      fill_in "Title", with: ''
      click_on 'Save'
    end
      expect(page).to have_content "Title can't be blank"
    end
  end
end
