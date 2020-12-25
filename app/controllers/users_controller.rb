class UsersController < ApplicationController
    before_action :authorize_to_view, only: [:show]
    before_action :restrict_signup, only: [:new, :create]


    def new
        @user = User.new 
    end 

    def show 
        @user = User.find_by_id(params[:id])
        @drama = Drama.find_by(params[:drama_id])
    end 

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user), info: "You've successfully signed up!"
        else 
            @errors = @user.errors.full_messages
            render :new  
    end 
end 

    private
    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end 
end
