class TinyHomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_tiny_home, only: [:show, :edit, :update, :destroy]

  def index
    # @tiny_homes = TinyHome.all
    @my_tiny_homes = policy_scope(TinyHome).where(user: current_user)
    # @other_tiny_homes = policy_scope(TinyHome).where.not(user: current_user)

    if params[:query].present?
      sql_query = "address @@ :query"
      # @other_tiny_homes = policy_scope(TinyHome).where(sql_query, query: "%#{params[:query]}%")
      @other_tiny_homes = policy_scope(TinyHome).near(params[:query], 50)
    else
      @other_tiny_homes = policy_scope(TinyHome).where.not(user: current_user)
    end

    @markers = @other_tiny_homes.geocoded.map do |other_tiny_home| {
        lat: other_tiny_home.latitude,
        lng: other_tiny_home.longitude,
        infoWindow: render_to_string(partial: "info_window_index", locals: { other_tiny_home: other_tiny_home }),
        image_url: helpers.asset_url('map_marker.svg')
      }
    end
  end

  def new
    @tiny_home = TinyHome.new
    authorize @tiny_home
  end

# params[:tiny_home][:amenity_ids]

  def create
    @tiny_home = TinyHome.new(tiny_home_params)
    @tiny_home.user = current_user
    authorize @tiny_home
    if @tiny_home.save
      params[:tiny_home][:amenity_ids].each do |id|
        HomeAmenity.create!(tiny_home_id: @tiny_home.id, amenity_id: id) unless id == ''
      end
      redirect_to tiny_home_path(@tiny_home), notice: 'Your tiny home was successfully created.'
    else
      render :new
    end
  end

  def show
    @marker = [{
        lat: @tiny_home.latitude,
        lng: @tiny_home.longitude,
        infoWindow: render_to_string(partial: "info_window_show", locals: { tiny_home: @tiny_home }),
        image_url: helpers.asset_url('map_marker.svg')
      }]
    @booking = Booking.new
  end

  def edit
  end

  def update
    if @tiny_home.update(tiny_home_params)
    raise
      redirect_to tiny_home_path(@tiny_home), notice: 'Your tiny home was successfully updated.'
    end
  end

  def destroy
    @tiny_home.destroy
    redirect_to tiny_homes_path, notice: 'Your tiny home was successfully deleted.'
  end

  def my_index
    @my_tiny_homes = TinyHome.all.where(user: current_user)
    @bookings = Booking.all.select do |b|
      @my_tiny_homes.include?(b.tiny_home)
    end
    @pendings = @bookings.select { |b| b.approved == false }
    authorize @my_tiny_homes
    # @my_tiny_homes = policy_scope(TinyHome)#.where(user: current_user)
    # @my_tiny_homes = policy_scope(tiny_home_class, policy_scope_class: TinyHomePolicy::Scope)#.where(user: current_user)
    # @my_tiny_homes = TinyHomePolicy::Scope.new(current_user, TinyHome).resolve
  end

  private

  def set_tiny_home
    @tiny_home = TinyHome.find(params[:id])
    authorize @tiny_home
  end

  def tiny_home_params
    params.require(:tiny_home).permit(:name, :address, :description, :available,
                                      :price, :room_number, :size, :user_id, :amenity_ids, photos: [])
  end
end
