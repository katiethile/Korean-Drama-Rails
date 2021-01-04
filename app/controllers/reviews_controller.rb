class ReviewsController < ApplicationController
before_action :find_by_review, only: [:show, :edit, :update, :destroy]
before_action :require_login 

    def index 
        @reviews = Review.all 
    end 

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
        if owner_of_review?
            @review 
        else
            redirect_to dramas_path, warning: "You do not have access to this!"
        end
    end  

    def update 
        @review.update(review_params)
        if @review.save 
        redirect_to user_path(current_user), info: "You've successfully updated your review!"
        else 
            @errors = @review.errors.full_messages
            render :edit
        end 
    end 

    def destroy 
        @review.destroy
        redirect_to user_path(current_user), info: "You've successfully deleted your review!"
    end 

    def highest_review
        @review = Review.all.order('rating asc').last
    end 


  private

    def find_by_review
        @review = Review.find(params[:id])
    end 

    def owner_of_review?
        current_user.id == @review.user_id 
    end 

    def review_params 
        params.require(:review).permit(:title, :content, :rating, :user_id, :drama_id)
    end 
end

