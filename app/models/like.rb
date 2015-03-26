class Like < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user

  #validates :tweet_id, presence: true, uniqueness: true
  #validates :tweet_id, uniqueness: { scope: [:user_id]}
  validates :tweet_id, :uniqueness => { :scope => :user_id }
  #scope :unfinished, -> { where(done: false) }

  validates_acceptance_of :value
  attr_accessor :value
  after_find { @value = '1' }
  
  def likable_for?(user, tweet)
    user && Like.exists?( user_id: user.id, tweet_id: tweet.id)
  end
 end
