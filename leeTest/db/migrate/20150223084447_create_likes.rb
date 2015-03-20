class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :tweet_id
	  t.boolean :done
      t.references :tweet, index: true
      t.timestamps null: false
    end
    add_foreign_key :likes, :tweets
  end
end
