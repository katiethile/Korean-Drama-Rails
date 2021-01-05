class ReviewsController < ApplicationController
before_action :find_by_review, only: [:show, :edit, :update, :destroy]
before_action :require_login 

    def index 
        @reviews = Review.all 
    end 

    def new 
        @drama = Drama.find(params[:drama_id])
        #finding the specific drama with drama_id using params using a get request 
        @review = current_user.reviews.build(drama: @drama)
        #here, the review instance is representing the new reviews that the user/current user is creating, and setting 
        #the drama instance in it. So when @review is called within the new form, current user is able to create a new review,
        #alongside with the drama_id. The user_id and drama_id is set as hidden within the views to make them exist as they are created.
    end 

    def show 

    end 

    def create 
        @review = Review.new(review_params)
        @drama = Drama.find(@review.drama.id)
        #this is finding/grabbing the drama_id within/from the review instance
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

