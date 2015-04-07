class ReLikesController < ApplicationController
  before_action :set_retweet
  
  def create
    if ReLike.create(retweet_id: params[:tweet_id], user_id: current_user.id)
	  redirect_to :back
    else
      redirect_to :back
    end
  end
   
   def destroy
	ReLike.where(retweet_id: @retweet.id, user_id: current_user.id).first.destroy
   
	redirect_to :back
  end
  
  private
  
  def set_retweet
    @retweet = Retweet.find(params[:tweet_id] || params[:id])
  end
  
end
