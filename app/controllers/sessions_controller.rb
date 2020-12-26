class SessionsController < ApplicationController
    def home 
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
        @user = User.find_or_create_by(username: auth['info']['name'], email: auth['info']['email']) do |u|  
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = 'asdfghjkl'
          end
          session[:name] = @user.username
          @user.save
          session[:user_id] = @user.id
          redirect_to dramas_path, info: "You're logged in via Facebook!"
    end

    def destroy
        session.clear
        redirect_to '/', info: "You've successfully logged out!"
    end 

    private 
    def auth 
        request.env['omniauth.auth']
    end 
end 