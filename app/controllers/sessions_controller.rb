class SessionsController < ApplicationController
    def home 
        @user = User.new 
    end 
    
    def new 
        @user = User.new 
    end 

    def create 
        user = User.find_by(username: params[:user][:username]) 
        if user && user.authenticate(params[:user][:password]) 
            session[:user_id] = user.id 
            redirect_to dramas_path, info: "You've successfully logged in!"
        else
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
        #binding.pry 
        request.env['omniauth.auth']['info']
    end 
end 