class DramasController < ApplicationController
    before_action :find_by, only: [:edit, :update, :destroy, :show]
    def index 
        @dramas = Drama.all 
    end 

    def new    
        @drama = Drama.new 
        @drama.reviews.build 
    end  
    

    def show 
        session[:drama_id] = @drama.id
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
                :content
              ]
        )
    end 
end
