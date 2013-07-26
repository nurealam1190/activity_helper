class FriendshipsController < ApplicationController
	def new
	end
	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
	    # Tell the UserMailer to send a welcome Email after save
        UserMailer.welcome_email(@friendship.friend, current_user).deliver
			flash[:success]="added friend"
			redirect_to root_path
		else
			flash[:error]="unable to add as friend"
			redirect_to root_path
		end

	end
	def destroy
		@friendship = current_user.friendships.find(params[:id])
		@friendship.destroy
		flash[:notice]="removed  from friendlist"
		redirect_to current_user
	end
	def update
		@friendship = current_user.inverse_friendships.find(params[:id])
		# raise @friendship.to_yaml
		if @friendship.update_attributes(:status => true)
			redirect_to current_user
		end
	end
end
