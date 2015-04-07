class TweetPageRepliesController < ApplicationController
before_action :authenticate_user!

def index
			@tweet = Tweet.new
			
			comments =  Comment.where(user_id: current_user.id)
			recomments =  ReComment.where(user_id: current_user.id)
			
			@comments_hash = {}
			
			comments.each do |comment|
				@comments_hash.store(comment.created_at, comment)
			end
			recomments.each do |recomment|
				@comments_hash.store(recomment.created_at, recomment)
			end
			
			@comments_hash = @comments_hash.sort_by{|key, val| key}.reverse!
			
			
			# 팔로우에서 내 아이디 빼기
			@users = User.where.not( id: current_user.id )
			
			tweet_count = Tweet.where(user_id: current_user.id).count
			retweet_count = Retweet.where(user_id: current_user.id).count
			comment_count = Comment.where(user_id: current_user.id).count
			recomment_count = ReComment.where(user_id: current_user.id).count
			@tweets_count = tweet_count + retweet_count + comment_count + recomment_count
			
			
			#hash설정
			tweets_page = Tweet.where(user_id: current_user.id)
			tweets_page_retweets = Retweet.where(user_id: current_user.id)
			
			
			@tweets_page_hash = {}
			
			tweets_page.each do |tweet|
				@tweets_page_hash.store(tweet.created_at, tweet)
			end
			tweets_page_retweets.each do |retweet|
				@tweets_page_hash.store(retweet.created_at, retweet)
			end
			
			@tweets_page_hash = @tweets_page_hash.sort_by{|key, val| key}.reverse!
			
			
	end
end
