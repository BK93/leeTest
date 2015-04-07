class RemoveImageToTweet < ActiveRecord::Migration
  def change
     remove_column :retweets, :tweet_userId
     remove_column :retweets, :tweet_username
     remove_column :tweets, :image
     remove_column :retweets, :image
  end
end
