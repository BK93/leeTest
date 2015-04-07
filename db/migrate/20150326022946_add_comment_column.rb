class AddCommentColumn < ActiveRecord::Migration
  def change
	add_column :comments, :image, :varchar
	add_column :comments, :username, :string
  end
end
