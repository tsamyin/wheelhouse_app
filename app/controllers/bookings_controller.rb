class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    # @bookings = Booking.all
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
  end

  def show
  end

  def new
    @tiny_home = TinyHome.find(params[:tiny_home_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tiny_home_id = params[:tiny_home_id]
    @booking.user = current_user
    @tiny_home = TinyHome.find(params[:tiny_home_id])
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Your booking was successfully completed.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Your booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Your booking was successfully cancelled.'
  end

  def approved!
    @approved = true
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :tiny_home_id, :user_id, :approved)
  end
end
