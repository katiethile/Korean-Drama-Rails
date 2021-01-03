class SessionsController < ApplicationController
    def home 
    end 
    
    def new 
    end 

    def create 
        user = User.find_by(username: params[:user][:username]) 
        if user && user.authenticate(params[:user][:password]) 
            session[:user_id] = user.id 
            redirect_to dramas_path, info: "You've successfully logged in!"
        else
           flash[:error] = "You have inputted invalid or blank fields!" 
           render :new
        end 
    end

    def create_with_fb 
        @user = User.find_or_create_by(username: auth['name'], email: auth['email']) do |u|
            u.password = 'asdfghjkl'
          end
          @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user), info: "You're logged in via Facebook!"
    end

    def destroy
        session.clear
        redirect_to '/', info: "You've successfully logged out!"
    end 

    private 
    def auth 
        request.env['omniauth.auth']['info']
    end 
end 