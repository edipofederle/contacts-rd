require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'has a valid fabricator' do
    expect(Fabricate(:contact)).to be_valid
  end

  it 'is invalid without a email' do
    expect(Fabricate.build(:contact, email: nil)).to_not be_valid
  end
end
