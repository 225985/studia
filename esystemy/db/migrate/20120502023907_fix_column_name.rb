class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :blogs, :blog_title, :title
  end

end
