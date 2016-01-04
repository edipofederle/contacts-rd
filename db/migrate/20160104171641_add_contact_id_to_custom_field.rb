class AddContactIdToCustomField < ActiveRecord::Migration
  def change
    add_column :custom_fields, :contact_id, :integer
  end
end
