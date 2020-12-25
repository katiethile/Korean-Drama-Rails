class ReviewsController < ApplicationController
before_action :find_by_review, only: [:show, :edit, :update, :destroy]
before_action :current_user, only: [:create, :update, :edit, :destroy]

    def new 
        @review = Review.new 
    end 

    def show 
    end 

    def create 
        @review = Review.new(review_params)
        @drama = Drama.find(session[:drama_id])
        if @review.save
            redirect_to drama_review_path(@drama, @review), info: "You've created a new review!"
        else 
            @errors = @review.errors.full_messages
            render :new 
        end 
    end 

    def edit 
    end 

    def update 
        if @review
        @review.update(review_params)
        redirect_to user_path(@user), info: "You've successfully updated your review!"
        else 
            @errors = @user.errors.full_messages
            render :edit
        end 
    end 

    def destroy 
        @review.destroy
        redirect_to user_path(@user), info: "You've successfully deleted your review!"
    end 

    private 

    def review_params 
        params.require(:review).permit(:title, :content, :rating, :user_id, :drama_id)
    end 
end
