class CommentsController < ApplicationController
	respond_to :html,:xml,:json

	def new
		@comment=Comment.new
	end

	def create
	

		@user=User.find_by_username(params[:user_id])
		@activity=@user.activities.find(params[:activity_page_id])
		@comment=@activity.comments.build(params[:comment])	

		@comment.user=current_user
		if @comment.save
			 @comments=@activity.comments.all
			respond_with do |format|
				format.html do
					if request.xhr?

						render partial: 'comments/comment', layout: false, status: :created, locals: {comment:@comments.first}
					end
				end
			end
			
		else
			respond_with do |format|
				format.html do 
					if request.xhr?
						render partial: 'comments/new_comment', layout: false, status: :error, locals: {rahul: @activity, comment: @comment }
					end
				end
			end
			#raise "fdgdsgdsg...........".to_yaml
			# flash[:sucess]="commented"
			# redirect_to root_path
		end
	end
	def show
		
		@comments=Comment.all
	end
end
