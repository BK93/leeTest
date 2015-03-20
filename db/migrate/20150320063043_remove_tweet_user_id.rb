class RemoveTweetUserId < ActiveRecord::Migration
  def change
     remove_column :retweets, :tweet_user_id
  end
end
