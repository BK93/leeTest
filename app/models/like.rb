class Like < ActiveRecord::Base
  belongs_to :tweet
  
  #validates :tweet_id, presence: true, uniqueness: true
  #validates :tweet_id, uniqueness: { scope: [:user_id]}
  
  validates :tweet_id, :uniqueness => { :scope => :user_id }

  belongs_to :retweet
 end
