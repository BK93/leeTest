class Like < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user

  validates :tweet_id, :uniqueness => { :scope => :user_id }
 
 def likable_for?(user, tweet)
    user && Like.exists?( user_id: user.id, tweet_id: tweet.id)
  end
 end
