class InverseMessagesController < ApplicationController
	def new
	end
	def create
		@friendship = current_user.inverse_friendships.find(params[:friendship_id])
		@message= @friendship.messages.build(params[:message])

		if @message.save
			flash[:success]="message sent"
			redirect_to current_user
		else
			flash[:error]="message can't sent"
			redirect_to current_user
		end
	end
end
