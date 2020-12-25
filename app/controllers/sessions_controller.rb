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
            redirect_to dramas_path 
        else
            #@errors = user.errors.full_messages
            render :new 
        end 
    end

    def create_with_fb 
        user = User.find_or_create_by(username: request.env['email']) do |u|
            u.password = 'asdfghjkl'
        end 
        user.save 
        session[:user_id] = user.id 
        redirect_to dramas_path 
     end 

    def destroy
        session.clear
        redirect_to '/'
    end 

    private 
    def auth 
        request.env['omniauth.auth']['info']
    end 
end 