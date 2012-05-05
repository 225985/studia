class AddSettingsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kind, :string
    add_column :users, :iter, :integer
    add_column :users, :size, :integer
  end
end
