class FollowingPagesController < ApplicationController

	def index
		@users = User.where.not( id: current_user.id )

		tweet_count = Tweet.where(user_id: current_user.id).count 
		retweet_count = Retweet.where(user_id: current_user.id).count
		comment_count = Comment.where(user_id: current_user.id).count 
		@tweets_count = tweet_count + retweet_count + comment_count	
		
		#following_pages hash설정
		follow_ids = Follow.where(user_id: current_user.id ).pluck(:follow_id)
		
		users = User.where(id: follow_ids)	
		
		@follow_users_hash = {}
		
		users.each do |user|
		  @follow_users_hash.store(user.created_at, user)
		end
		
		@follow_users_hash = @follow_users_hash.sort_by{|key, val| key}.reverse!

	end
	
	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		
		redirect_to following_pages_path
	end
end
