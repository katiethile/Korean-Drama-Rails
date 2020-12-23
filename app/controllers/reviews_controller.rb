class ReviewsController < ApplicationController
before_action :find_by, only: [:show, :edit, :update, :destroy]

    def new 
        @review = Review.new 
    end 

    def show 
    end 

    def create 
        @review = Review.new(review_params)
        @drama = Drama.find(session[:drama_id])
        if @review.save! 
            redirect_to drama_review_path(@drama, @review)
    end 
end 

    def edit 
    end 

    def update 
        if @review 
        @review = Review.update(review_params)
        redirect_to drama_review_path
        else 
            render :edit
        end 
    end 

    def destroy 
        @review.destroy
        redirect_to dramas_path 
    end 

    private 

    def review_params 
        params.require(:review).permit(:title, :content, :rating, :user_id, :drama_id)
    end 
end
