class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @superhero = Superhero.find(params[:superhero_id])
  end
end
