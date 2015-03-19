class RemoveRetweetUserId < ActiveRecord::Migration
  def change
    remove_column :retweets, :user_id
  end
end
