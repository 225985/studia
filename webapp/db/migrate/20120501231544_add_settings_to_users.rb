class AddSettingsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kind, :String

    add_column :users, :iter, :Int

    add_column :users, :size, :Int

  end
end
