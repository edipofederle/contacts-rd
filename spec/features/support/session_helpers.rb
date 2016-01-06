module Features
  module SessionHelpers
    def user_registration(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end

   def login(email, password)
     visit new_user_session_path
     fill_in 'Email', with: email
     fill_in 'Password', with: password
     click_button 'Log in'
   end
  end

  module Helpers
    def given_an_custom_field_for_user(user, field_spec)
      Fabricate(:custom_field, 
        user: user,
        name: field_spec[:name],
        field_type: field_spec[:type],
        combo_options: field_spec[:options]
      )
    end
  end
end
