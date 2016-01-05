class Contact < ActiveRecord::Base
  validates :email, presence: true, email: true
  serialize :contact_fields, Hash

  belongs_to :user

  def remove_custom_field(key)
    self.contact_fields.delete(key)
  end

end
