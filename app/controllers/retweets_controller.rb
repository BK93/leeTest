class RetweetsController < ApplicationController
  before_action :set_retweet, only: [:show, :update, :destroy]

  def show
   @retweet = Tweet.find(params[:id])
  end
  
  def new
	@retweet = Retweet.new 
	@retweet_find = Tweet.find(params[:tweet_id])
  end

  def create
    @retweet = Retweet.new(retweet_params)

	if @retweet.save
	  redirect_to tweets_path, notice: 'retweetが追加されました！'
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
	  params.require(:retweet).permit(:tweet_id, :content, :tweet_user_id, :image, :comment)
	end
end
