class TweetPagesController < ApplicationController

	def index
			@tweet = Tweet.new
			@tweets = Tweet.all.order("id DESC") 
			
			# 팔로우에서 내 아이디 빼기
			@users = User.where.not( id: current_user.id )
			
			#tweet_page hash설정
			user_id = User.where(id: current_user.id ).pluck(:id)
			
			tweets_page = Tweet.where(user_id: user_id)
			tweets_page_retweets = Retweet.where(user_id: user_id)
			
			@tweets_page_hash = {}
			
			tweets_page.each do |tweet|
			  @tweets_page_hash.store(tweet.created_at, tweet)
			end
			tweets_page_retweets.each do |retweet|
			  @tweets_page_hash.store(retweet.created_at, retweet)
			end
			
			@tweets_page_hash = @tweets_page_hash.sort_by{|key, val| key}.reverse!
	end
	
	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		
		redirect_to tweet_pages_path
	end
	
	
end
