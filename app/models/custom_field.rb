class CustomField < ActiveRecord::Base
  validates :name, :field_type, presence: true

  def select_options
    return if self.field_type != "combo_box"
    self.combo_options.split(',').map(&:strip)
  end

  def remove
   contacts_that_use_this_field = 
     Contact.all.select {
     |contact| contact.contact_fields.include? self.name.downcase.to_sym
   }
   
   contacts_that_use_this_field.each do |contact|
     contact.remove_custom_field(self.name.downcase.to_sym)
     contact.save!
   end

   self.destroy!

  end
end
