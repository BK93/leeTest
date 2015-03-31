class Retweet < ActiveRecord::Base

  belongs_to :tweet
  # has_many :likes
  belongs_to :user
end
