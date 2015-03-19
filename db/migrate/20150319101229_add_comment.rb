class AddComment < ActiveRecord::Migration
  def change
    add_column :retweets, :comment, :string
  end
end
