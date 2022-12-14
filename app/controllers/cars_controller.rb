class CarsController < ApplicationController

  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def home
    @cars = Car.all
    @car = Car.find(params[:id])
  end

  def index
    @car_images = ["car1.jpg", "car2.jpg", "car3.jpg", "car4.jpg", "car5.jpg","car6.jpg", "car8.jpg","car9.jpg","car9.jpg","car10.jpg","car11.jpg", "car12.jpg", "car13.jpg", "car15.jpg"]
    @cars = Car.all
        # Geocoder
        @markers = @cars.geocoded.map do |car|
          {
            lat: car.latitude,
            lng: car.longitude,
            info_window: render_to_string(partial: "popup", locals: { car: car}),
            image_url: helpers.asset_url("carlogo.png")
          }
        end
        # End Geocoder

    # search database section
    if params[:query].present?
      @cars = Car.search_by_make_and_colour_and_year(params[:query])
    else
      @cars = Car.all
    end
    # End Search database section

  end

  def show
    @car_image = ["car1.jpg", "car2.jpg", "car3.jpg", "car4.jpg", "car5.jpg","car6.jpg", "car8.jpg","car9.jpg","car9.jpg","car10.jpg","car11.jpg", "car12.jpg", "car13.jpg", "car15.jpg"].sample
    @review = Review.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to cars_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car.destroy
    redirect_to cars_path, status: :see_other
  end

  def available?(period)
    if bookings.loaded?
      bookings.none? { |booking| booking.overlap?(period) }
    else
      bookings.overlap(period).none?
    end
  end


private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :make, :year, :category, :description, :price, :transmission, :colour, :address, :availability, :photo)
  end
end
