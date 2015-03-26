class AddUsernameToRetweets < ActiveRecord::Migration
  def change
    add_column :retweets, :username, :string
  end
end
