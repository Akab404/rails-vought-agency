class ReviewsController < ApplicationController
  before_action :set_superhero

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.superhero = @superhero
    @review.user = current_user
    if @review.save!
      redirect_to superhero_path(@superhero)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_superhero
    @superhero = Superhero.find(params[:superhero_id])
  end

  def reviews_params
    params.require(:review).permit(:comment, :rating)
  end
end
