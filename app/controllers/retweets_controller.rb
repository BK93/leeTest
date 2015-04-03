class RetweetsController < ApplicationController
  before_action :set_retweet, only: [:update, :destroy]

  def show
    @retweet = Retweet.new
	@retweet_find = Tweet.find(params[:tweet_id])	
  end
  
  def new
	@retweet = Retweet.new 
	@retweet_find = Tweet.find(params[:tweet_id])
  end

  def create
    @retweet = Retweet.new(retweet_params)

    if @retweet.save
		PostMailer.post_mail(params[:tweet_id]).deliver
		
		redirect_to tweets_path, notice: 'retweet complete!'
    else
	  render :back
    end
  end
   
  def destroy
    @retweet = Retweet.find(params[:id])
    @retweet.destroy
	
    redirect_to :back
  end
 
  
  private
    def set_retweet
      @retweet = Retweet.find(params[:id])
    end
	
    def retweet_params
      params.require(:retweet).permit( :tweet_id, :image, :username, :user_id, :content, :tweet_userId, :tweet_username )
    end
end
