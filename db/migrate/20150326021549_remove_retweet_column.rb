class RemoveRetweetColumn < ActiveRecord::Migration
  def change
    remove_column :retweets, :content
    remove_column :retweets, :comment
  end
end
