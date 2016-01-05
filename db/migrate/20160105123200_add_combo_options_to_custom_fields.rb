class AddComboOptionsToCustomFields < ActiveRecord::Migration
  def change
    add_column :custom_fields, :combo_options, :string
  end
end
