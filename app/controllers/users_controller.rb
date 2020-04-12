class UsersController < ApplicationController
    before_action :current_user_present, only: [:new, :login]
	def new
      @user = User.new
	end

	def create
		@user = User.new(permit_params)
	     if @user.save &&  User.check_password(params)
           redirect_to login_path
	     else
	     	render 'new'
	     end
	  
	end

	def login
    end

	def new_session
	  @user = User.find_by_email(params["user"]["email"])
	 
	  if @user.present? && (@user.password == params["user"]["password"])
	  	session[:user_id] = @user.id
	    flash[:notice] = "you have successfully loged in"
	  	redirect_to root_path
	  else
	  	flash[:notice] = "User credentials are wrong"
	  	render 'login'
	  end
	end
   
    def destroy_session
      session.destroy
      redirect_to login_path
    end

	private

	 def permit_params
       params.require(:user).permit(:name, :email, :password)
	 end
end
