require 'rails_helper'

feature 'User can edit persanal information', %q{
  In order to edit persanal information at my account
  As an authenticated user
  I'd like to be able to edit persanal information
} do

  given(:user) { create(:user) }

  scenario 'User edit persanal information with valid attributes' do
    sign_in(user)
    click_on 'My Account'
    click_on 'Edit persanal information'

    page.find(:css, "#user_first_name").set('Petr')
    page.find(:css, "#user_last_name").set('Petrov')
    page.find(:css, "#user_date_of_birth").set('24.08.1997')
    page.find(:css, "#user_current_weight").set(86.0)
    page.find(:css, "#user_target_weight").set(80.0)
    click_on 'Update Persanal Info'

    expect(page).to have_content("Petr Petrov")
    expect(page).to have_content("24.08.1997")
    expect(page).to have_content("86.0")
    expect(page).to have_content("80.0")
   
  end

   scenario 'User log in to his account without the added persanal information' do
    #sign_in(user)
    #click_on 'My Account'

    #expect(page).to have_content("Add persanal information")
  end
end
