class AddColumnContentOfRetweets < ActiveRecord::Migration
  def change

	add_column :retweets, :content, :text
  end

end
