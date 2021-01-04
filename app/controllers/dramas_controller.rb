class DramasController < ApplicationController
    before_action :find_by_drama, only: [:edit, :update, :show, :destroy]
    before_action :is_admin?, except: [:index, :show]
    before_action :require_login

    def index 
        @dramas = Drama.alphabetized
    end 

    def new    
        @drama = Drama.new 
    end  
    

    def show 
        session[:drama_id] = @drama.id
    end 

    def create 
        @drama = Drama.new(drama_params)
        if @drama.save 
            redirect_to dramas_path, info: "You've successfully created a drama!"
        else 
            @errors = @drama.errors.full_messages
            render :new 
        end 
    end 

    def update 
        @drama = Drama.update(drama_params)
        redirect_to dramas_path, info: "You've successfully edited drama info!"
    end 

    def edit 
    end 

    def destroy 
        @drama.destroy
        redirect_to dramas_path, warning: "Drama was deleted!"
    end 

    private 

    def drama_params
        params.require(:drama).permit(
            :name,
            :genre,
            reviews_attributes: [
                :title,
                :rating,
                :content,
                :user_id,
                :drama_id
              ]
        )
    end 

    def find_by_drama
        @drama = Drama.find(params[:id])
    end

    def is_admin?
        if current_user.admin != true 
            redirect_to dramas_path, warning: "You do not have access to this!"
        end 
    end
end
