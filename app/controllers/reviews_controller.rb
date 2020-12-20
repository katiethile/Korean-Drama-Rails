class ReviewsController < ApplicationController
    def new 
        @review = Review.new 
    end 

    def show 
        @review = Review.find(params[:id])
    end 

    def create 
        @review.new(review_params)
        if @review.save 
            redirect_to new_drama_review_path 
    end 
end 

    def edit 

    end 

    def update 

    end 

    def destroy 

    end 

    private 
    def review_params 
        params.require(:review).permit(:title, :content, :rating, :user_id, :drama_id)
    end 
end
