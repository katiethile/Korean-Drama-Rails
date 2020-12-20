class DramasController < ApplicationController
    def index 
        @dramas = Drama.all 
    end 

    def new 

    end 

    def show 
        @drama = Drama.find(params[:id])
    end 
end
