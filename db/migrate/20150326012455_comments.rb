class Comments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :tweet_id
      t.text :comment

      t.timestamps
    end
  end
end
