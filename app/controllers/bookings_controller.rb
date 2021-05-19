class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @tiny_home = TinyHome.find(params[:tiny_home_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tiny_home_id = params[:tiny_home_id]
    @booking.user = current_user
    @tiny_home = TinyHome.find(params[:tiny_home_id])
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Your booking was successfully completed.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: 'Your booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to tiny_homes_path, notice: 'Your booking was successfully cancelled.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :tiny_home_id, :user_id)
  end
end
