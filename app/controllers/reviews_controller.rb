class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review[:booking_id] = @booking.id
    authorize @review
    if @review.save
      redirect_to booking_path(@booking), notice: 'Your review was successfully completed.'
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @booking = @review.booking
  end

  def update
    raise
    @booking = Booking.find(params[:booking_id])
    @review = @booking.review

    if @review.update(booking_params)
      redirect_to bookings_path, notice: 'Your booking was successfully updated.'
    else
      render :edit
    end
    redirect_to booking_path(@booking)
  end

  def destroy
    @review = Review.find(params[:id])
    @booking = @review.booking
    @review.destroy
    authorize @review
    redirect_to booking_path(@booking)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :star, :booking_id)
  end
end
