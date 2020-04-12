class WelcomeController < ApplicationController
  def home
  	current_user
  	logger.info "current user present #{@current_user.present?}"
  end

  private
   def current_user
     if session["user_id"].present?
     	@current_user = User.find_by_id(session["user_id"])
     	@current_user
     else
     	redirect_to new_user_path
     end
   end
end
