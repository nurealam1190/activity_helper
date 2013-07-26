class ActivityPagesController < ApplicationController
  respond_to :html, :xml, :json
	#before_filter :signed_in_user?, only: [:create]
  #  def signed_in_user
  #     unless signed_in?
  # #     #store_location
  #     redirect_to signin_url, notice: "Please sign in." 
  #  end

	def home
		 
		 @activity = current_user.activities.build if signed_in?
     @activities = Activity.paginate(page: params[:page])
     @comment=Comment.new
     @comments=Comment.all

     
	end
	#before_filter :signed_in_user

  def create
    @activity = current_user.activities.build(params[:activity])
    if @activity.save
       @comment=@activity.comments.new
        @comment.user=current_user
      @activities=Activity.paginate(page: params[:page])
      respond_with do |format|
        format.html do 
          if request.xhr?

            render partial: 'activity', layout: false, status: :created, locals: {nures: @activities.first, comment:@comment}
          else
            flash[:success]="activity created"
            redirect_to root_path
          
          end
        end
      end
       
     else
        respond_with do |format|
          format.html do 
          if request.xhr?
            render partial: 'new_post_form', layout: false, status: :error, locals: {activity: @activity, comment:@comment }
          else
            flash[:erro]="can't create activity"
            redirect_to root_path
          
          end

        end
      end
      
    end
  end

  def destroy
  end
  def activity
  end
  

end


