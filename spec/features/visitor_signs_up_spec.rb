require "rails_helper"

feature 'Create new User' do
  scenario 'with valid email and password' do
    user_registration("edipo@gmail.com", "quandoeuviromeubone")
    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    user_registration("edipo", "quandoeuviromeubone")
    
    expect(page).to have_content('Log in')
  end

  scenario 'with invalid password' do
    user_registration("edipo@gmail.com", "foo")
    
    expect(page).to have_content('Log in')
  end

  scenario 'with empty password' do
    user_registration("edipo@gmail.com", "")
    
    expect(page).to have_content('Log in')
  end
end

feature 'Login' do
  scenario 'with valid user' do
    user = Fabricate(:user)
    login(user.email, user.password)

    expect(page).to have_content(user.email)
  end

  scenario 'with invalid user' do
   login("invalid@gmail.com", "secretpassword")

   expect(page).to_not have_content('Sign out')
  end
end
