class ReservationsController < ApplicationController
  def new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to restaurants_url
    else
      render restaurant_url
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:time_slot, :restaurant_id, :user_id, :guests)
  end
end
