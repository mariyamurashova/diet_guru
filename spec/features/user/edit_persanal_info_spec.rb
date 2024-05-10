require 'rails_helper'

feature 'User can edit persanal information', %q{
  In order to edit persanal information at my account
  As an authenticated user
  I'd like to be able to edit persanal information
} do

  given(:user) { create(:user) }

  background do
    sign_in(user)
    click_on 'My Account'
    click_on 'Edit persanal information'
  end

  scenario 'User edit persanal information with valid attributes' do
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

  scenario 'User can attach avatar to his account' do
    attach_file 'Image', "#{Rails.root}/spec/fixtures/avatar.jpg"
    click_on 'Update Persanal Info'

    expect(page).to have_xpath("//img[contains(@src, \"avatar.jpg\")]")
  end

  scenario 'User can delete attached file' do
    attach_file 'Image', "#{Rails.root}/spec/fixtures/avatar.jpg"
    click_on 'Update Persanal Info'
    click_on 'Edit persanal information'
    click_on 'Delete Photo'

    expect(page).to_not have_xpath("//img[contains(@src, \"avatar.jpg\")]")
  end
end
