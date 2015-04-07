class Retweet < ActiveRecord::Base

  belongs_to :tweet
  belongs_to :user
  has_many :re_likes
  has_many :re_comments, :dependent => :destroy

end
