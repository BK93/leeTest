class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.integer :tweet_id
      t.string :t_id
      t.string :content
      t.string :user_id

      t.timestamps null: false
    end
  end
end
