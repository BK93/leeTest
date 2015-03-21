class RetweetsController < ApplicationController
  before_action :set_retweet, only: [:update, :destroy]

  def new
	@retweet = Retweet.new 
	@retweet_find = Tweet.find(params[:tweet_id])
  end

  def create
    @retweet = Retweet.new(retweet_params)

    if @retweet.save
	  redirect_to tweets_path, notice: 'retweet complete!'
    else
	  render 'new'
    end
  end
   
  def destroy
    @retweet = Retweet.find(params[:id])
    @retweet.destroy
	
    redirect_to tweets_path
  end
 
  
  private
    def set_retweet
      @retweet = Retweet.find(params[:id])
    end
	
    def retweet_params
      params.require(:retweet).permit(:tweet_id, :content, :image, :comment)
    end
end
