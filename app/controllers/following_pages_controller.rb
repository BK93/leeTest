class FollowingPagesController < ApplicationController

	def index
		@users = User.all

		#following_pages hash설정
		follow_ids = Follow.where(user_id: current_user.id ).pluck(:follow_id)
		
		users = User.where(id: follow_ids)	
		
		@follow_users_hash = {}
		
		users.each do |user|
		  @follow_users_hash.store(user.created_at, user)
		end
		
		@follow_users_hash = @follow_users_hash.sort_by{|key, val| key}.reverse!
		
		Hash[@follow_users_hash].values.each do |obj|
		p obj
		end

	end
	
	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		
		redirect_to following_pages_path
	end
end
