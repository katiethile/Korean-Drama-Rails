class ApplicationController < ActionController::Base
    helper_method :current_user
    add_flash_types :info, :error, :warning

    private 
    def current_user
        @user = User.find_by(id: session[:user_id])
    end  

    def is_logged_in?
        !!session[:user_id]
    end 

    def require_login
        unless is_logged_in?
          redirect_to '/', warning: "You must be logged in to access this section"
        end
      end
end
