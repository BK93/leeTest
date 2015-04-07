class RemoveUserIdToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :username
    remove_column :comments, :userId
    remove_column :comments, :image
    remove_column :re_comments, :username
    remove_column :re_comments, :userId
    remove_column :re_comments, :image
  end
end
