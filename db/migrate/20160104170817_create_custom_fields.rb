class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|

      t.timestamps null: false
    end
  end
end
