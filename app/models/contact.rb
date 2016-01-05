class Contact < ActiveRecord::Base
  validates :email, presence: true, email: true

  has_many :fields, class_name: "CustomField"

  serialize :contact_fields, Hash
end
