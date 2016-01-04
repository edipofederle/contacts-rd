class Contact < ActiveRecord::Base
  validates :email, presence: true, email: true
end
