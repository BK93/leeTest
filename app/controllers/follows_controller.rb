class FollowsController < ApplicationController

  def create
    if Follow.create(follow_id: params[:tweet_id], user_id: current_user.id)
	  redirect_to tweets_path
    else
      redirect_to tweets_path
    end
  end

  def destroy
    Follow.where(follow_id: params[:tweet_id], user_id: current_user.id).first.destroy
	
    redirect_to tweets_path
  end
end
