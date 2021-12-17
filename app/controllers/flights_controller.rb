class FlightsController < ApplicationController
  def index
    p search_params.to_h.filter { |k, v| k != 'number_of_passengers' && !v.blank? }
    @flights = Flight.all.where(search_params.to_h.filter { |k, v| k != 'number_of_passengers' && !v.blank? })
    @passengers = search_params.fetch('number_of_passengers', 0).to_i
    @airports = Airport.all.pluck(:code, :id)
    @dates = Flight.all.select(:start).distinct.pluck(:start)
  end

  private 

  def search_params
    params.permit(:departure_airport, :arrival_airport, :start, :number_of_passengers)
  end
end
