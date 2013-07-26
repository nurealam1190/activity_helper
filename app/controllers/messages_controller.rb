class MessagesController < ApplicationController
	def new
		@message=Message.new

	end
	def create
		@friendship= Friendship.find(params[:friendship_id])
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
