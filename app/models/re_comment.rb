class ReComment < ActiveRecord::Base
	belongs_to :tweet
	belongs_to :retweet
	belongs_to :user
end
