class TinyHomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_tiny_home, only: [:show, :edit, :update, :destroy]

  def index
    # @tiny_homes = TinyHome.all
    @tiny_homes = policy_scope(TinyHome).order(created_at: :desc)
  end

  def new
    @tiny_home = TinyHome.new
    authorize @tiny_home
  end

  def create
    @tiny_home = TinyHome.new(tiny_home_params)
    @tiny_home.user = current_user
    authorize @tiny_home
    if @tiny_home.save
      redirect_to tiny_home_path(@tiny_home), notice: 'Your tiny home was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tiny_home.update(tiny_home_params)
      redirect_to tiny_home_path(@tiny_home), notice: 'Your tiny home was successfully updated.'
    end
  end

  def destroy
    @tiny_home.destroy
    redirect_to tiny_homes_path, notice: 'Your tiny home was successfully deleted.'
  end

  private

  def set_tiny_home
    @tiny_home = TinyHome.find(params[:id])
    authorize @tiny_home
  end

  def tiny_home_params
    params.require(:tiny_home).permit(:name, :address, :description, :available,
                                      :price, :room_number, :size, :user_id, photos: [])
  end
end
