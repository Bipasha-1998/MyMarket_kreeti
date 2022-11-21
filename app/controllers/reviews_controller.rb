class ReviewsController < ApplicationController
  before_action :require_admin, only: %i[index destroy toggle_is_approved]
  
  def index
    @reviews = Review.page(params[:page]).per(5)
  end

  def new; end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    redirect_to product_path(@product), notice: 'Review has been created successfully...Waiting to be approved by the Admin'
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: 'Review has been deleted successfully'
  end
  
  def toggle_is_approved
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    admin = current_user.username
    @review.update(is_approved: true, approved_by: admin)
    redirect_to reviews_path, notice: 'The review is successfully approved'
  end

  private

  def review_params
    params.require(:review).permit(:reviewer, :review_body)
  end
end
