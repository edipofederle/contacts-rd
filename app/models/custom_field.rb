class CustomField < ActiveRecord::Base
  validates :name, :field_type, presence: true
end
