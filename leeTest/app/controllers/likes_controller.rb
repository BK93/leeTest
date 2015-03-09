class LikesController < ApplicationController

  def new
	@like = Like.new 
	@like_find = Tweet.find(params[:tweet_id])
  end

  def create
    @like = Like.new(like_params)

	if @like.save
	  redirect_to tweets_path
    else
	  render :action => “new”
	end
  end
  
  private
  
    def like_params
	  params.require(:like).permit(:tweet_id)
	end
end
