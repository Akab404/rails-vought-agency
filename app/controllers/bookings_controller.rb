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
    @booking.accepted = nil
    @booking.superhero = @superhero
    @booking.user = current_user
    booking_save
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update!(accepted: true)
    redirect_to users_account_path, status: :see_other
    flash[:alert] = "You accepted the reservation of #{@booking.user.email} made on #{@booking.superhero.name}"
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update!(accepted: false)
    redirect_to users_account_path, status: :see_other
    flash[:alert] = "You declined the reservation of #{@booking.user.email} made on #{@booking.superhero.name}"
  end
end

private

def booking_save
  if @booking.save!
    redirect_to superhero_path(@superhero)
    flash[:alert] = "Vous avez bien reservé #{@superhero.name}"
  else
    render 'superheros/show', status: :unprocessable_entity
  end
end

def booking_params
  params.require(:booking).permit(:checkin, :checkout)
end
