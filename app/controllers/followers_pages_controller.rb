class FollowersPagesController < ApplicationController
	def index
		@users = User.where.not( id: current_user.id )
		
		tweet_count = Tweet.where(user_id: current_user.id).count 
		retweet_count = Retweet.where(user_id: current_user.id).count
		comment_count = Comment.where(user_id: current_user.id).count 
		@tweets_count = tweet_count + retweet_count + comment_count

		# hash설정
		follower_ids = Follow.where(follow_id: current_user.id ).pluck(:user_id)
		
		follower_users = User.where(id: follower_ids)	
		
		@follower_users_hash = {}
		
		follower_users.each do |user|
		  @follower_users_hash.store(user.created_at, user)
		end
		
		@follower_users_hash = @follower_users_hash.sort_by{|key, val| key}.reverse!
	end
	
	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		
		redirect_to following_pages_path
	end
end
