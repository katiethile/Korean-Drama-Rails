class ApplicationController < ActionController::Base
    helper_method :current_user, :is_logged_in?, :find_by_drama, :find_by_review

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
end
