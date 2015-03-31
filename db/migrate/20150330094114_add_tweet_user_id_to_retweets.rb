class AddTweetUserIdToRetweets < ActiveRecord::Migration
  def change
    add_column :retweets, :tweet_userId, :string
    add_column :retweets, :tweet_username, :string
  end
end
