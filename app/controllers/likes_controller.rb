class LikesController < ApplicationController

  def index
    redirect_to new_tweet_like_path(params[:tweet_id])
  end

  def new
	@like = Like.new 
	@like_find = Tweet.find(params[:tweet_id])
  end

  def create
    @like = Like.new(like_params)

	if @like.save
	  redirect_to tweets_path
    else
	  flash.now[:notice] = "もう LIKE しました"
	  render 'new'
	  # render :action => "new"
	  # render :template => "tweets/show"
	end
  end
  
  private
  
    def like_params
	  params.require(:like).permit(:tweet_id, :user_id)
	end
end
