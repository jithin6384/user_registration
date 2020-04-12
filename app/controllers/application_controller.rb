class ApplicationController < ActionController::Base


	def current_user_present
      if session["user_id"].present?
           @user = User.find_by_id(session["user_id"])
			redirect_to root_path
			flash[:notice] = "User #{@user.name} has already signed in"
      end
	end
end
