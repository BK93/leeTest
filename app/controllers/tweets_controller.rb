class TweetsController < ApplicationController
	before_action :authenticate_user!

	  def index
		@tweet = Tweet.new
		@tweets = Tweet.all.order("id DESC") 
		
		tweet_count = Tweet.where(user_id: current_user.id).count
		retweet_count = Retweet.where(user_id: current_user.id).count
		comment_count = Comment.where(user_id: current_user.id).count
		@tweets_count = tweet_count + retweet_count + comment_count

		# 내 트윗, 리트윗
		own_tweets = current_user.tweets
		own_retweets = current_user.retweets
		
		# 나는 팔로우 목록에서 뺀다
		@users = User.where.not( id: current_user.id )
				
		# follow한 사람의 tweet, retweet
		follow_ids = Follow.where(user_id: current_user.id ).pluck(:follow_id)
		tweets = Tweet.where(user_id: follow_ids)
		retweets = Retweet.where(user_id: follow_ids)
		
		tweets_adds = own_tweets + tweets
		retweets_adds = own_retweets + retweets
		
		@tweets_hash = {}
		
		tweets_adds.each do |tweet|
			@tweets_hash.store(tweet.created_at, tweet)
		end
		retweets_adds.each do |retweet|
			@tweets_hash.store(retweet.created_at, retweet)
		end

		@tweets_hash = @tweets_hash.sort_by{|key, val| key}.reverse!
	  end

	  def show 
		@tweet = Tweet.find(params[:id])
		@retweet = Retweet.new 
	  end

	  def new
		@tweet = Tweet.new
	  end
	  
	  def create
		@tweet = Tweet.new(tweet_params)
		
		if @tweet.save
		  redirect_to tweets_path, notice: 'tweet complete!'
		else
		  render 'new'
		end
	  end
	  
	  def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		
		redirect_to :back
	  end
	  
	  def update
		@tweet = Tweet.find(params[:id])
		if @tweet.update(tweet_params)
			  redirect_to tweets_path
		else
		  render 'new'
		end
	  end
	 
	  private
	   
	   def tweet_params
		 params[:tweet].permit(:content, :user_id, :image, :tweet_userId, :tweet_username)
	   end
end
