class RemoveDone < ActiveRecord::Migration
  def change

	remove_column :likes, :done
  end
end
