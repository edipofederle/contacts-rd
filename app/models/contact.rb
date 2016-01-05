class Contact < ActiveRecord::Base
  validates :email, presence: true, email: true
  serialize :contact_fields, Hash
end
