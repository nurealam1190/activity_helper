class MessagesController < ApplicationController
	respond_to :html, :xml, :json
	def new
		@message=Message.new

	end
	def create
		

		# @friendship= Friendship.find(params[:recipient_id])
		# @message= @friendship.messages.build(params[:message])
		if params[:recipient_id]
				recipient=User.find(params[:recipient_id])
				@message = current_user.messages.build(:message => params[:message][:message], recipient_id: recipient.id) 
	    else
	    	str=params[:message][:message]
	    	msg=str.gsub(str.scan(/@[a-zA-Z]+/).last, " ")
	    	var=str.scan(/@[a-zA-Z]+/).last
	    	p=var.scan(/[a-zA-Z]+/)


	    	# p=str.scan(/[a-zA-Z]+/)
	    	# str=str.gsub(p.first, " ")
	    	recipient=User.find_by_username(p)
	    	if p.first!=current_user.username
	    	  @message=current_user.messages.build(message:msg, recipient_id:recipient.id)
	        end 
	    end   

		if @message.save

			@messages=current_user.messages.where(recipient_id: recipient.id)
			@inverse_messages = current_user.inverse_messages.where(user_id: recipient.id)
			@allmessages = @messages+@inverse_messages
			
			@message.user=current_user
			 respond_with do |format|
			 	format.html do
			 		if request.xhr?
			 			render partial: 'messages/conversation', layout: false, status: :created, locals: {messages: @allmessages, friend_id: recipient.id}
                    else
						flash[:success]="message sent"
						redirect_to current_user
					end
				end
			end
		else
			flash[:error]="message can't sent"
			redirect_to current_user
		end
	end

	def index
        @friend_id=params[:user_id]
        # logger.debug "------------>> TIME"
        # logger.debug Time.zone.at(params[:after].to_i)
        # @messages = current_user.inverse_messages.select(:created_at)
        # logger.debug @messages
        @messages=current_user.inverse_messages.where("user_id = ? AND created_at > ?", params[:user_id], Time.zone.at(params[:after].to_i+1)).last
        #@messages = current_user.inverse_messages.first
  #       logger.debug "------------------->>> MESSAGE STARTS HERE"
  #       logger.debug @messages
		# respond_with do |format|
		# 	format.js
  #           format.html 
  #       end
		# @friends = current_user.friends.all 
		# @inverse_friends = current_user.inverse_friends.all
	end
	def conversation
	    @friend_id=params[:param1]
	     
		@messages = current_user.messages.where(recipient_id: @friend_id)
		
		@inverse_messages = current_user.inverse_messages.where(user_id: @friend_id)
		@allmessages = @messages+@inverse_messages
		@inverse_messages.update_all(status: true)

		respond_with do |format|
			format.js
            format.html 
            #     if request.xhr?format.js
	            
                   
            #         render partial: 'messages/conversation', layout: false, status: :created, locals: {messages: @allmessages}
            #          flash[:success]="yes"
            #     else
            #         flash[:success]="ok"
            #     end
            # end
        end
	end
	def destroy
		@message = Message.find(params[:id])
		@friend_id = params[:friend_id]
		if @message.destroy
			@messages = current_user.messages.where(recipient_id: @friend_id)
			@inverse_messages = current_user.inverse_messages.where(user_id: @friend_id)
			@allmessages = @messages+@inverse_messages
			respond_with do |format|
				format.js
	            format.html 
	        end
	    end
	end
	def get_friends
		friends=[]
		var="#{params[:q]}"
	
		var1=var.scan(/\w+/).last
		
		all=User.where("username LIKE ?","#{var1}%")
		all.each  do |friend|
		         #if (current_user.friendships.find_by_friend_id(friend.id) || current_user.inverse_friendships.find_by_user_id(friend.id))
				    name= friend.username
				    a=var
				    b=a.gsub(a.scan(/@[a-z]+/).last, "@")+name

					image="http://www.gravatar.com/avatar/" + friend.email
					friends << {value:b, text:name, image:image}
				 #end

        end

		

		render json: friends
	end
end
