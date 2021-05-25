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
    authorize(@review)
    # @booking = @review.booking
  end

  def update
    @review = Review.find(params[:id])
    authorize(@review)
    # @booking = Booking.find(params[:booking_id])

    if @review.update(review_params)
      redirect_to booking_path(@review.booking), notice: 'Your booking was successfully updated.'
    else
      render :edit
    end
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
