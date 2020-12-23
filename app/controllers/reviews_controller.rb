class ReviewsController < ApplicationController
    def new 
        @review = Review.new 
    end 

    def show 
        @review = Review.find_by(id: params[:id])
    end 

    def create 
        @review = Review.new(review_params)
        @drama = Drama.find(session[:drama_id])
        if @review.save! 
            redirect_to drama_review_path(@drama, @review)
    end 
end 

    def edit 
        @review = Review.find(params[:id])

    end 

    def update 
        @review = Review.find(params[:id])
        if @review 
        @review = Review.update(review_params)
        redirect_to drama_review_path
        else 
            render :edit
        end 
    end 

    def destroy 
        review = Review.find(params[:id])
        review.destroy
        redirect_to dramas_path 
    end 

    private 
    def review_params 
        params.require(:review).permit(:title, :content, :rating, :user_id, :drama_id)
    end 
end
