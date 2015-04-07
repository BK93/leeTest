class RemoveUserIdToTweet < ActiveRecord::Migration
  def change
    remove_column :tweets, :tweet_userId
    remove_column :tweets, :tweet_username
  end
end
