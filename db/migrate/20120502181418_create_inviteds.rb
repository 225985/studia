class CreateInviteds < ActiveRecord::Migration
  def change
    create_table :inviteds do |t|
      t.integer :blog_id
      t.integer :user_id

      t.timestamps
    end
  end
end
