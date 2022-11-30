class BookingsController < ApplicationController
  before_action :set_bookings, only: %i[edit update show]

  def index
    # @bookings = Booking.all
    @bookings = Booking.where(user: current_user)
  end

  def edit
  end

  def new
    # raise
    @article = Article.find(params[:article_id])
    @booking = Booking.new
  end

  def create
    # raise
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @article = Article.find(params[:article_id])
    @booking.article = @article
    if @booking.save
      redirect_to article_path(@article), notice: "Request sent to owner."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:comment)
  end

  def set_bookings
    @booking = Booking.find(params[:id])
  end
end
