class Follow < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :retweet
  belongs_to :user
  
  # validates :follow_id, :uniqueness => { :scope => :user_id, :message => "jiij" }
   validates_uniqueness_of :follow_id, :scope => :user_id
   
	def able?(user, tweet)
		user && Follow.exists?( user_id: user.id, follow_id: tweet.id)
	end
end
