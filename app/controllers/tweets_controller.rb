class TweetsController < ApplicationController

	  def index
		follow_ids = Follow.where(user_id: current_user.id ).pluck(:follow_id)
		
		tweets = Tweet.where(user_id: follow_ids)
		retweets = Retweet.where(user_id: follow_ids)
		comments = Comment.where(user_id: follow_ids)	
		
		@tweet = Tweet.new
		@users = User.all
		
		@tweets_hash = {}
		
		tweets.each do |tweet|
		  @tweets_hash.store(tweet.created_at, tweet)
		end
		
		retweets.each do |retweet|
		  @tweets_hash.store(retweet.created_at, retweet)
		end
		
		@tweets_hash = @tweets_hash.sort_by{|key, val| key}
		
		Hash[@tweets_hash].values.each do |obj|
		p obj
		
	end
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
		
		redirect_to tweets_path
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
		 params[:tweet].permit(:content, :user_id, :image)
	   end
end
