require 'rails_helper'

feature 'User can delete the dish', %q{
  In order to delete the dish
  As an owner of the dish 
  I'd like to be able to delete the dish
} do
  given(:user) { create(:user) }
  given!(:dish) { create(:dish, user: user) }
   
   describe 'Authenticated user' do 
    background do
      sign_in(user)
      click_on "My Account" 
      within '.user_dishes' do
        click_on "#{dish.title}"
      end
    end

    scenario "the dish's owner can delete it" do
      click_on "Delete the Dish"
      expect(page).to have_content ("The dish was successfully deleted")
    end
  end
end
