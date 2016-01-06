require "rails_helper"

feature 'Manage Custom Fields' do
  scenario 'create new custom field text_field' do
    user = Fabricate(:user)
    login(user.email, user.password)

    click_link "Custom Fields"
    click_link "Add new Custom Field"

    fill_in 'Name', with: "age"
    select  'text_field', :from => "Field type"
    
    click_button "Create Custom Field"
    expect(page).to have_content("Custom Field was successfully created.")
    expect(page).to have_content("age")
    expect(page).to have_content("text_field")
  end

  scenario 'create new custom field combo_box', js: true do
    user = Fabricate(:user)
    login(user.email, user.password)

    click_link "Custom Fields"
    click_link "Add new Custom Field"

    fill_in 'Name', with: "color"
    select  'combo_box', :from => "Field type"
    fill_in 'Combo options', with: "blue, green, black"
    
    click_button "Create Custom Field"
    expect(page).to have_content("Custom Field was successfully created.")
    expect(page).to have_content("color")
    expect(page).to have_content("combo_box")
  end

  scenario 'create new custom field text_area', js: true do
    user = Fabricate(:user)
    login(user.email, user.password)

    click_link "Custom Fields"
    click_link "Add new Custom Field"

    fill_in 'Name', with: "bio"
    select  "text_area", :from => "Field type"
    
    click_button "Create Custom Field"
    expect(page).to have_content("Custom Field was successfully created.")
    expect(page).to have_content("bio")
    expect(page).to have_content("text_area")
  end

  
end
