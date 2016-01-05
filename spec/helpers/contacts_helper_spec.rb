require 'rails_helper'

RSpec.describe ContactsHelper, type: :helper do
  it {
    custom_field = Fabricate(:custom_field)

    contact      = Fabricate(:contact, contact_fields: {company: 10})
    expect(helper.field_content(contact, custom_field)).to eq 10
  }

  it {
    custom_field = Fabricate(:custom_field_combo)
    contact      = Fabricate(:contact, contact_fields: {company: 10})
    expect(helper.field_content(contact, custom_field)).to eq '-'
  }
end
