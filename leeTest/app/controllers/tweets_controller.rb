class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
	@retweets = Retweet.all
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
	  redirect_to tweets_path
	else
	  render 'new'
	end
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
	  params[:tweet].permit(:content, :user_id)
	end
	
	#필터링(project의 title만)을 해주고 
	#create의 project_params로 넘겨준다
end
