require 'rails_helper'

feature 'User can sign in', %q{
  In order to create menu and count calories
  As an unauthenticated user
  I'd like to be able to sign in
} do

   given(:user) { create(:user) }
   given(:user_without_persanal_info) { create(:user, email: 'ivanov@test.com', password: '111111') }

  scenario 'Registred user tries to sign in' do
    User.create!(email: 'ivanov@test.com', password: '111111')
    
    visit new_user_session_path
    fill_in 'Email', with: 'ivanov@test.com'
    fill_in 'Password', with: '111111'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  
  end

  scenario 'Unregistred user tries to sign in' do
   visit new_user_session_path
  fill_in 'Email', with: 'wrong@test.com'
  fill_in 'Password', with: '12345678'
  click_on 'Log in'

  expect(page).to have_content 'Invalid Email or password'
  end

  describe 'User can log in to his account'

  scenario 'User has added persanal information log in to his account' do
    sign_in(user)
    click_on 'My Account'

    expect(page).to have_content("#{user.first_name}, #{user.last_name}")
  end

   scenario 'User log in to his account with the added persanal information' do
    sign_in(user)
    click_on 'My Account'

    expect(page).to have_content("#{user.first_name}, #{user.last_name}")
  end

   scenario 'User log in to his account without the added persanal information' do
    sign_in(user_without_persanal_info)
    click_on 'My Account'

    expect(page).to have_content("Add persanal information")
  end
end
