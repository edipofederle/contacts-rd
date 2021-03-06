Fabricator(:contact) do
  email "jhonlocke@gmail.com"
  user
end

Fabricator(:contact_with_company, from: :contact) do
  contact_fields { {company: "Resultados Digitais"}}
end

Fabricator(:contact_custom_fields, from: :contact) do
  contact_fields { {company: "Resultados Digitais", age: 35}}
end

Fabricator(:contact_invalid, class_name: Contact) do
  user
  name "Jhon Locke"
  email nil
end
