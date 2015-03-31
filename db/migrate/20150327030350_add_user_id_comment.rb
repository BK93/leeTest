class AddUserIdComment < ActiveRecord::Migration
  def change
  	add_column :comments, :userId, :integer
  	add_column :retweets, :userId, :integer
  end
end
