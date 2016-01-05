class AddUserIdToCustomFields < ActiveRecord::Migration
  def change
    add_column :custom_fields, :user_id, :integer
  end
end
