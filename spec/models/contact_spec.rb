require 'rails_helper'

RSpec.describe Contact, type: :model do

  it { should have_many(:fields) }
  it { should validate_presence_of(:email) }
  it { should serialize(:contact_fields) }

  it 'an contact with custom fields' do
    contact_with_custom_fields = Fabricate(:contact_custom_fields)

    contact = OpenStruct.new(contact_with_custom_fields.contact_fields)
    expect(contact.company).to eq "Resultados Digitais"
    expect(contact.age).to eq 35
  end

end
