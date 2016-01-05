module ContactsHelper
  def field_content(contact, field)
    value = contact.contact_fields[field.name.downcase.to_sym]
    value.blank? ? '-' : value
  end
end
