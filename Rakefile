require_relative "lib/airport"
require_relative "lib/airports"
require_relative "lib/dms_coordinate"
require "geocoder"

data_dir      = "./subscription-data"
airports_file = "#{data_dir}/APT.txt"
all_lines     = File.open(airports_file)
airport_lines = Airports.airport_lines(all_lines)
airports      = Airports.parse(airport_lines)
data_keys     = %w(identifier airport_name city country icao latitude longitude elevation timezone)

desc "Find country by coordinates test"
task :find_country_by_coords do
  #test_airport = airports.first
  test_airport = airports.select { |ap| ap.icao.start_with?("M") }.first
  a = Airport.new(test_airport)
  lat = a.latitude_dd
  lng = a.longitude_dd
  puts Geocoder.search("#{lat}, #{lng}")[0].country
end

desc "Build csv file for airports api"
task :build do
  airports.each do |airport_pikelet_struct|
    line_obj = []
    airport = Airport.new(airport_pikelet_struct)
    data_keys.each_with_index do |key, i|
      case key
      when "latitude"
        line_obj << airport.latitude_dd
      when "longitude"
        line_obj << airport.longitude_dd
      when "country"
        line_obj << airport.country
      when "timezone"
        line_obj << airport.timezone.to_s
      else
        line_obj << airport.send(key)
      end
    end
    puts line_obj.join(",")
  end
end
