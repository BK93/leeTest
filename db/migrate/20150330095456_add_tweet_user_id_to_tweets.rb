class AddTweetUserIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_userId, :string
    add_column :tweets, :tweet_username, :string
  end
end
