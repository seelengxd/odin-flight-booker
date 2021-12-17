class BookingsController < ApplicationController
  def new
    @flight_id = params[:flight_id]
    @number_of_passengers = params[:number_of_passengers]
  end
end
