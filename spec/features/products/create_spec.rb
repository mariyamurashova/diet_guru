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
      fill_in 'Brand name', with: 'brand_name'
      fill_in 'Calorie', with: '100'
      fill_in 'Protein', with: '5'
      fill_in 'Carbohydrate', with: '6'
      fill_in 'Fat', with: '7'   
    end

    scenario 'adds a product' do 
      click_on 'Save Product'
      expect(page).to have_content 'the new product has been successfully created'
    end

    scenario "doesn't add a product" do 
      fill_in 'Title', with: ''
      click_on 'Save'
      expect(page).to have_content "Title can't be blank"
    end
  end
end
