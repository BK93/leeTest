class CommentsController < ApplicationController

  def new
  	@comment = Comment.new 
	@retweet_find = Tweet.find(params[:tweet_id])
	# @retweet = Retweet.new 
	# @retweet_find = Tweet.find(params[:tweet_id])
  end

  def create
    #@comment = Retweet.new(retweet_params)
    @comment = Comment.new(comment_params)

    if @comment.save
	  redirect_to tweets_path, notice: 'comment complete!'
    else
	  render 'new'
    end
  end
   
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
	
    redirect_to tweets_path
  end

  private
	
    def comment_params
      params.require(:comment).permit(:tweet_id, :username, :image, :comment, :user_id)
    end
end
