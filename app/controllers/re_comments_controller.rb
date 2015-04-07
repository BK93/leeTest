class ReCommentsController < ApplicationController
  
  def new
  	@recomment = ReComment.new 
	@retweet_find = Retweet.find(params[:tweet_id])
  end

  def create
    @recomment = ReComment.new(recomment_params)

    if @recomment.save
	  redirect_to tweets_path, notice: 'comment complete!'
    else
	  render :back
    end
  end
   
  def destroy
    @recomment = ReComment.find(params[:id])
    @recomment.destroy
	
    redirect_to tweets_path
  end

  private
	
    def recomment_params
      params.require(:re_comment).permit(:retweet_id, :comment, :user_id)
    end
end
