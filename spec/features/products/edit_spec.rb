require 'rails_helper'

feature "User can edit information about the product", %q{
  In order to correct product's incorrect information
  As an authenticated user
  I'd like to be able to edit product's information 
} do

given(:user) { create(:user) }
given!(:product) { create(:product) }
 
describe 'Authenticated user' do 
  background do
    sign_in(user)
    click_on "My Account" 
    within '.products' do
      click_on "#{product.title}"  
    end
  end

  scenario 'can view information about product', js:true do
    expect(page).to have_content ("#{product.calorie}")
    expect(page).to have_content ("#{product.protein}")  
    expect(page).to have_content ("#{product.fat}")
    expect(page).to have_content ("#{product.carbohydrate}")
  end

  scenario "user edits product with valid attributes", js:true do
   
      within ".product#{product.id}_info" do
        click_on "edit"
      end

      within ".products_edit_form" do
        fill_in "Title", with: 'Updated title'
      end
      click_on 'Save'

      within ".notice" do
         expect(page).to have_content 'the product has been successfully updated'
      end
      within ".product#{product.id}_info" do   
        expect(page).to have_content ("Updated title")
      end
    end

  scenario "user edits product with invalid attributes", js:true do
   
      within ".product#{product.id}_info" do
        click_on "edit"
      end

      within ".products_edit_form" do
        fill_in "Title", with: ''
      end
      click_on 'Save'

      within ".errors" do
         expect(page).to have_content "Title can't be blank"
      end
    end
end
end
