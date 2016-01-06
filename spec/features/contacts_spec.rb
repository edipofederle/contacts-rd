require "rails_helper"

feature 'Manage Contacts' do
  scenario 'create new contact' do
    user = Fabricate(:user)
    login(user.email, user.password)

    click_link 'New Contact'
    
    fill_in 'Name', with: "Stallone"
    fill_in 'Email', with: "flacaocompeao@gmail.com"
    
    click_button 'Create Contact'
    expect(page).to have_content("Contact was successfully created.")
  end

  scenario 'create new contact with custom fields - text_field' do
    user = Fabricate(:user)
    given_an_custom_field_for_user(user, {:name => "Age", :type => "text_field"})

    login(user.email, user.password)

    click_link 'New Contact'
    
    fill_in 'Name', with: "Stallone"
    fill_in 'Email', with: "flacaocompeao@gmail.com"
    fill_in 'Age', with: 10
   

    click_button 'Create Contact'
    
    expect(page).to have_content("Contact was successfully created.")
    expect(page).to have_content("age: 10")    
  end

  scenario 'create new contact with custom fields - text_area' do
    user = Fabricate(:user)
    given_an_custom_field_for_user(user, {:name => "bio", :type => "text_area"})

    login(user.email, user.password)

    click_link 'New Contact'
    
    fill_in 'Name', with: "Stallone"
    fill_in 'Email', with: "flacaocompeao@gmail.com"
    fill_in 'Bio', with: "A trucker"
   

    click_button 'Create Contact'
    
    expect(page).to have_content("Contact was successfully created.")
    expect(page).to have_content("A trucker")
  end


  scenario 'create new contact with custom fields - combo_box' do
    user = Fabricate(:user)
    given_an_custom_field_for_user(user, {:name => "color", :options => "blue,green,black", type: "combo_box"})

    login(user.email, user.password)

    click_link 'New Contact'
    
    fill_in 'Name', with: "Stallone"
    fill_in 'Email', with: "flacaocompeao@gmail.com"
    select  'blue', :from => "Color"
   

    click_button 'Create Contact'
    
    expect(page).to have_content("Contact was successfully created.")
    expect(page).to have_content("blue")
  end

  scenario 'edit an contact' do
    user = Fabricate(:user)
    given_an_contact_with_custom_field(user)

    login(user.email, user.password)

    click_link "Edit"
    fill_in 'Name', with: "Mike"
    fill_in 'Company', with: "XPTO"

    click_button 'Update Contact'

    expect(page).to have_content("Mike")
    expect(page).to have_content("XPTO")
  end

  scenario 'destroy an contact', js: true do
    user = Fabricate(:user)
    given_an_contact_with_custom_field(user)

    login(user.email, user.password)

    click_link 'Destroy'
    page.driver.browser.switch_to.alert.accept
    
    expect(page).to have_content("Contact was successfully destroyed.")
  end

end
