class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :destroy]

   

	def show
		if @user = User.find_by_username(params[:id])
		  @activities=@user.activities.paginate(page: params[:page])
      @message=Message.new
      @comment=Comment.new

      
      
      
    else
      flash[:notice] = "Sorry! The page you requestes does not exist"
      redirect_to root_url
    end
	end

  def index
    @user=User.all
      
  end
  
  private
    def signed_in_user
      unless signed_in?
      #store_location
      redirect_to new_user_session_path, notice: "Please sign in." 
    end
  end

  
	
end
