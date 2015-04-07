class TweetPagesController < ApplicationController
	before_action :authenticate_user!
	
	def index
			@tweet = Tweet.new
			
			# 팔로우에서 내 아이디 빼기
			@users = User.where.not( id: current_user.id )
			
			# 카운트
			tweet_count = Tweet.where(user_id: current_user.id).count
			retweet_count = Retweet.where(user_id: current_user.id).count
			comment_count = Comment.where(user_id: current_user.id).count
			recomment_count = ReComment.where(user_id: current_user.id).count
			@tweets_count = tweet_count + retweet_count + comment_count + recomment_count

			#tweet_page hash설정
			
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
	
	def show
		@user = User.find(params[:id])
		@user_id = Tweet.where(user_id: @user)
		
		# 카운트
		tweet_count = Tweet.where(user_id: params[:id]).count
		retweet_count = Retweet.where(user_id: params[:id]).count
		comment_count = Comment.where(user_id: params[:id]).count
		recomment_count = ReComment.where(user_id: params[:id]).count
		@tweets_count = tweet_count + retweet_count + comment_count + recomment_count
		
		# hash설정
		tweets_page = Tweet.where(user_id: params[:id])
		tweets_page_retweets = Retweet.where(user_id: params[:id])
			
		@tweets_page_hash = {}
			
		tweets_page.each do |tweet|
			@tweets_page_hash.store(tweet.created_at, tweet)
		end
		tweets_page_retweets.each do |retweet|
			@tweets_page_hash.store(retweet.created_at, retweet)
		end
			
		@tweets_page_hash = @tweets_page_hash.sort_by{|key, val| key}.reverse!
		
		# 팔로우에서 내 아이디 빼기
		@users = User.where.not( id: params[:id] )
			
	end
	
	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		
		redirect_to tweet_pages_path
	end
	
	
end
