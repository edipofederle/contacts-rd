class AddNameToCustomFields < ActiveRecord::Migration
  def change
    add_column :custom_fields, :name, :string
  end
end
