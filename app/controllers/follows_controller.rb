class FollowsController < ApplicationController

  def create
    if Follow.create(follow_id: params[:tweet_id], user_id: current_user.id)
	  redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    Follow.where(follow_id: params[:tweet_id], user_id: current_user.id).first.destroy

    redirect_to :back
  end
  
end
