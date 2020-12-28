class ApplicationController < ActionController::Base
    helper_method :current_user, :authorize_to_view_review
    add_flash_types :info, :error, :warning


    private 
    def authorize_to_view_review
        unless current_user
            redirect_to dramas_path
      end
    end

    def owner_of_review?
        current_user.id == @review.user_id 
    end 

    def current_user
        @user = User.find_by(id: session[:user_id])
    end  
end
