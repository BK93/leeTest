class AddColumnReLikes < ActiveRecord::Migration
  def change
	add_column :re_likes, :retweet_id, :integer
	add_column :re_likes, :user_id, :integer
  end
end
