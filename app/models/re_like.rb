class ReLike < ActiveRecord::Base
  belongs_to :retweet
  belongs_to :user
  belongs_to :tweet
  
	def likable_for?(user, tweet)
		user && ReLike.exists?( user_id: user.id, retweet_id: tweet.id)
	end
	
end
