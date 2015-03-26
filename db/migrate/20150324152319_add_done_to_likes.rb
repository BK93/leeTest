class AddDoneToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :done, :boolean
  end
end
