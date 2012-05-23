class AddSettingsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kind, :string, :default => "mandelbrot"
    add_column :users, :iter, :integer, :default => 1000
    add_column :users, :size, :integer, :default => 256
  end
end
