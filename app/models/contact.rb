class Contact < ActiveRecord::Base
  validates :email, presence: true, email: true
  serialize :contact_fields, Hash

  belongs_to :user

  # Given a key (e.g: :age)
  # remove it from contact_fields
  # attribute of a contact.
  #
  # These method is used
  # when some custom field is removed
  # and some contact makes use of this field
  #
  def remove_custom_field(key)
    self.contact_fields.delete(key)
  end

end
