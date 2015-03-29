class LikesController < ApplicationController
  before_action :set_tweet
  
  def create
    if Like.create(tweet_id: params[:tweet_id], user_id: current_user.id)
	  redirect_to tweets_path
    else
      redirect_to tweets_path
    end
  end
  
  def destroy
    Like.where(tweet_id: @tweet.id, user_id: current_user.id).first.destroy
    redirect_to tweets_path
  end
  
  private
  
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id] || params[:id])
  end
  

end
