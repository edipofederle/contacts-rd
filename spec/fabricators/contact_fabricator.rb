Fabricator(:contact) do
  email "jhonlocke@gmail.com"
end

Fabricator(:contact_invalid, class_name: Contact) do
  name "Jhon Locke"
  email nil
end
