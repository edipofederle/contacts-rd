Fabricator(:custom_field) do
  name "Company"
  field_type "text_field"
end

Fabricator(:custom_field_invalid, from: :custom_field) do
  name nil
  field_type "text_field"
end


Fabricator(:custom_field_combo, class_name: CustomField) do
  name "Sexo"
  field_type "combo_box"
  combo_options "Masculino, Feminino"
end
