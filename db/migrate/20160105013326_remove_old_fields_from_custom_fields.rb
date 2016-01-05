class RemoveOldFieldsFromCustomFields < ActiveRecord::Migration
  def change
    remove_column :custom_fields, :content, :string
    remove_column :custom_fields, :contact_id, :integer
  end
end
