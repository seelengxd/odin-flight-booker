# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clear Database
Flight.delete_all
Airport.delete_all

airport_codes = %w(SIN BWN BEK MFM FSZ)
airport_count = 5
airport_codes.each do |code|
  Airport.create(code: code)
end

airport_ids = Airport.all.pluck(:id)
10.times do 
  arrival_airport_id, departure_airport_id = airport_ids.sample(2)
  start = DateTime.now + rand(30)
  flight_duration = rand(300)
  f = Flight.create(arrival_airport_id: arrival_airport_id,
                departure_airport_id: departure_airport_id,
                start: start, 
                flight_duration: flight_duration)
  
  puts f.errors.full_messages
end
