class AddDiscussionToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :kind, :string

    add_column :blogs, :public, :Boolean

  end
end
