class BookingsController < ApplicationController
  before_action :set_bookings, only: %i[edit update show]

  def index
    @bookings = Booking.all
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :comment)
  end

  def set_bookings
    @booking = Booking.find(params[:id])
  end
end
