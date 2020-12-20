class DramasController < ApplicationController
    def index 
        @dramas = Drama.all 
    end 

    def new 
        @drama = Drama.new 
        @drama.reviews.build
    end 

    def show 
        @drama = Drama.find(params[:id])
    end 

    def create 
        @drama = Drama.new(drama_params)
        if @drama.save 
            redirect_to drama_path(@drama)
    end 
end 

    private 
    def drama_params
        params.require(:drama).permit(
            :name,
            reviews_attributes: [
                :title,
                :content,
                :rating,
              ]
        )
    end 
end
