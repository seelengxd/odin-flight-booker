class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @number_of_passengers = params[:number_of_passengers].to_i
    @booking = Booking.new(flight_id: params[:flight_id])
    @number_of_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(permitted_params)
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  def permitted_params
    params.require(:booking).permit(:flight_id, :passenger, passengers_attributes: [:name, :email])
  end
end
