class BookingsController < ApplicationController
  def new
    @superhero = Superhero.find(params[:superhero_id])
    @booking = Booking.new
    @booking.superhero = @superhero

    # if @booking.save!
    # redirect_to list_path(@list)
    # else
    # render 'lists/show', status: :unprocessable_entity
    # end
  end

  def create
    @superhero = Superhero.find(params[:superhero_id])
    @booking = Booking.new(booking_params)
    @booking.superhero = @superhero
    @booking.user = current_user
    @booking.save!
    redirect_to root_path
  end


end

private

def booking_params
  params.require(:booking).permit(:superhero_id, :checkin, :checkout)
end
