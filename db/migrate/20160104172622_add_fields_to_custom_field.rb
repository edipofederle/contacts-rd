class AddFieldsToCustomField < ActiveRecord::Migration
  def change
    add_column :custom_fields, :type, :string
    add_column :custom_fields, :content, :string
  end
end
