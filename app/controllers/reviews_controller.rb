class ReviewsController < ApplicationController
  before_action :set_car, only: :create

  def create
    @review = Review.new(review_params)
    @review.car = @car
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to car_reviews_path(@car) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render 'cars/show', status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to car_path(@review), status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
