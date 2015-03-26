class Tweet < ActiveRecord::Base
	belongs_to :user
	
	has_many :retweets
	has_many :likes
	has_many :comments

	validates :content, presence: { message: "入力して！"},
	length: { minimum: 2, message: "短い！" }
end
