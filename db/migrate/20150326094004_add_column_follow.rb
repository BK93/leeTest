class AddColumnFollow < ActiveRecord::Migration
  def change
	add_column :follows, :user_id, :integer 
	add_column :follows, :follow_id, :integer
  end
end
