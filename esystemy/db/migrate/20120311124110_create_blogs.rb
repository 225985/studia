class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :blog_title
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
