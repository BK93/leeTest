class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
	
		t.integer :user_id, :default => crrunt_user.id
		t.integer :follow_id, :default => crrunt_user.id
	
		t.timestamps null: false
    end
  end
end
