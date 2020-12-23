class DramasController < ApplicationController
    def index 
        @dramas = Drama.all 
    end 

    def new 
        @drama = Drama.new 
        @drama.reviews.build 
    end 

    def show 
        @drama = Drama.find_by(id: params[:id])
        session[:drama_id] = @drama.id
    end 

    def create 
       # binding.pry 
        @drama = Drama.new(drama_params)
        if @drama.save 
            redirect_to dramas_path
        else 
            render :new 
    end 
end 

    def update 

    end 

    def edit 

    end 

    def destroy 

    end 


    private 
    def drama_params
        params.require(:drama).permit(
            :name,
            :genre,
            reviews_attributes: [
                :title,
                :content,
                :rating,
              ]
        )
    end 
end
