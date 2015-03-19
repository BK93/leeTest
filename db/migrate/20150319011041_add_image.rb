class AddImage < ActiveRecord::Migration
  def change
    add_column :tweets, :image, :string
    add_column :retweets, :image, :string
 
  end
end
