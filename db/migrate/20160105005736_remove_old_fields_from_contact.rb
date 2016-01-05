class RemoveOldFieldsFromContact < ActiveRecord::Migration
  def change
    remove_column :contacts, :properties, :text
  end
end
