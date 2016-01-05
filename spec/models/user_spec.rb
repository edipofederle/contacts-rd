require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:contacts) }
  it { should have_many(:custom_fields) }
end
