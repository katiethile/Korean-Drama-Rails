class DramasController < ApplicationController
    before_action :find_by_drama, only: [:edit, :update, :show, :destroy]
    before_action :current_user, only: [:create, :update, :edit, :show, :destroy]
    def index 
        @dramas = Drama.all 
    end 

    def new    
        @drama = Drama.new 
        @drama.reviews.build 
    end  
    

    def show 
        session[:drama_id] = @drama.id
        @drama = Drama.find(session[:drama_id])
    end 

    def create 
        @drama = Drama.new(drama_params)
        if @drama.save 
            redirect_to dramas_path
        else 
            render :new 
    end 
end 

    def update 
        @drama = Drama.update(drama_params)
        redirect_to dramas_path 
    end 

    def edit 
    end 

    def destroy 
        @drama.destroy
        redirect_to dramas_path 
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
                :user_id
              ]
        )
    end 
end
