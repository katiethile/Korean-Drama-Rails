class ApplicationController < ActionController::Base
    helper_method :current_user, :is_logged_in?, :find_by_drama, :find_by_review
    add_flash_types :info, :error, :warning


    private 

    def current_user
        @user = User.find_by(id: session[:user_id])
    end 

    def find_by_drama
        @drama = Drama.find(params[:id])
    end 

    def find_by_review
        @review = Review.find(params[:id])
    end 
  
    def find_by_user
        @user = User.find(params[:id])
    end 

      def is_logged_in?
          !!session[:user_id] 
      end

      def authorize_to_view
        if User.find(params[:id]) != current_user
            redirect_to dramas_path
      end
    end 

    def is_admin?
        if current_user.admin != true 
            redirect_to dramas_path, warning: "You do not have access to this!"
        end 
    end 

    def restrict_signup 
        if !!session[:user_id]
            redirect_to dramas_path 
        end
    end 
end
