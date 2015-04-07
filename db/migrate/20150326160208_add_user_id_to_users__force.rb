class AddUserIdToUsersForce < ActiveRecord::Migration
  def change
	add_column :users, :userId, :string, unique: true
  end
end
