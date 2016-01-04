class CustomField < ActiveRecord::Base
  belongs_to :contact

  validates :name, :field_type, presence: true
end
