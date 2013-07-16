class ActivityPagesController < ApplicationController
	#before_filter :signed_in_user

	def home
		
		 @activity = current_user.activities.build if signed_in?
     @oldactivity = Activity.paginate(page: params[:page])

     #@user=
	end
	#before_filter :signed_in_user

  def create
    @activity = current_user.activities.build(params[:activity])
    if @activity.save
      flash[:success] = "Activity created!"
      redirect_to root_url
    else
      @oldactivity = Activity.paginate(page: params[:page])
      render 'activity_pages/home'
    end
  end

  def destroy
  end
  def activity
  end
  

end
