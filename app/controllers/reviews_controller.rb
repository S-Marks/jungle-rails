class ReviewsController < ApplicationController
    before_filter :authorize

    #Creates a review
    def create
        @review = Review.new(review_params)
        @review.product = Product.find(params[:product_id])
        @review.user = current_user
        
        # Current user validity check before save
        if current_user.valid?
            @review.save
        end

        redirect_to @review.product
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to @review.product
    end

    private
    def review_params
        params.require(:review).permit(
            :description,
            :rating
        )
    end
end
