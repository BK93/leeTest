class AddUserIdToReComments < ActiveRecord::Migration
  def change
    add_column :re_comments, :user_id, :integer
  end
end
