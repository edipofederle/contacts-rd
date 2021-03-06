require 'rails_helper'

RSpec.describe CustomField, type: :model do
 it { should validate_presence_of(:name) }
 it { should validate_presence_of(:field_type) }
 it { should belong_to(:user) }

 describe '#select_options' do
   it 'returns a array contains the combobox options' do
     custom_field_combo_box = Fabricate(:custom_field_combo)
     expect(custom_field_combo_box.select_options).to eq ["Masculino", "Feminino"]
   end
   
   it 'returns nil when not a combobox field' do
     custom_field = Fabricate(:custom_field)
     expect(custom_field.select_options).to eq nil
   end
 end

 describe '#remove' do
   it 'should remove field from contact' do
     custom_field_company       = Fabricate(:custom_field)
     contact_with_custom_fields = Fabricate(:contact_with_company)

     expect{
       custom_field_company.remove}.to change(CustomField,:count).by(-1)
     expect(Contact.last.contact_fields).to be_empty     
   end
 end

 it 'should contains a connstant with fields types' do
   expect(CustomField::FIELDS).to eq %w[text_field text_area combo_box]
 end
 
end
