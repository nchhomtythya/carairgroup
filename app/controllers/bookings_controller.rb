class BookingsController < ApplicationController

  before_action :set_car, only: %i[create new]
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def show
    set_booking
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car
    if @booking.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to dashboard_path, status: :see_other
  end

  def destroy
    @booking.destroy
    redirect_to car_path(@booking.car), status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
