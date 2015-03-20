class RetweetsController < ApplicationController
  before_action :set_retweet, only: [:show, :update]

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
	  PostMailer.post_mail.deliver
      
	  redirect_to tweets_path
    else
	  render :action => “new”
	end
  end
  
  private
    def set_retweet
      @retweet = Retweet.find(params[:id])
    end
	
    def retweet_params
	  params.require(:retweet).permit(:tweet_id, :content, :user_id, :t_id)
	end
end
