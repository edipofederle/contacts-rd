class CustomField < ActiveRecord::Base
  validates :name, :field_type, presence: true

  def select_options
    return if self.field_type != "combo_box"
    self.combo_options.split(',').map(&:strip)
  end
end
