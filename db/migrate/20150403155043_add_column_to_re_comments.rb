class AddColumnToReComments < ActiveRecord::Migration
  def change
    add_column :re_comments, :retweet_id, :integer
    add_column :re_comments, :comment, :text
    add_column :re_comments, :image, :string
    add_column :re_comments, :username, :string
    add_column :re_comments, :userId, :string
    add_column :re_comments, :user_id, :integer
  end
end
