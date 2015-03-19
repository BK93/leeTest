class RenameTId < ActiveRecord::Migration
  def change
    rename_column :retweets, :t_id, :tweet_user_id
  end
end
