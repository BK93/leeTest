class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all 
    # @retweets = Retweet.all
    # @times = Tweet.all + Retweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
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
