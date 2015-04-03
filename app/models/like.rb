class Like < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user
  belongs_to :retweet

  validates :tweet_id, :uniqueness => { :scope => :user_id }
 
	def likable_for?(user, tweet)
		user && Like.exists?( user_id: user.id, tweet_id: tweet.id)
	end
	
	def likable_for_to?(user, tweet)
		user && Like.exists?( user_id: user.id, tweet_id: tweet.tweet_id )
	end
	
 end
