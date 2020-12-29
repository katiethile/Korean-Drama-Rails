class ApplicationController < ActionController::Base
    helper_method :current_user
    add_flash_types :info, :error, :warning

    private 
    def current_user
        @user = User.find_by(id: session[:user_id])
    end  
end
