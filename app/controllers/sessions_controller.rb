class SessionsController < ApplicationController
    def home 
    end 
    
    def new 
        #@user = User.new 
    end 

    def create 
        user = User.find_by(:username => params[:user][:username]) 
        if user && user.authenticate(params[:user][:password]) 
            session[:user_id] = user.id 
           # @errors = user.errors.full_messages 
            redirect_to dramas_path 
        else
            render :new 
        end 
    end

    def destroy
        session.clear(:user_id)
        redirect_to '/'
    end 
end 