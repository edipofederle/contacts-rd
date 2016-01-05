class AddContactFieldsToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :contact_fields, :text
  end
end
