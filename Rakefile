require_relative "lib/airport"
require_relative "lib/airports"
require_relative "lib/dms_coordinate"

data_dir      = "./subscription-data"
airports_file = "#{data_dir}/APT.txt"
all_lines     = File.open(airports_file)
airport_lines = Airports.airport_lines(all_lines)
airports      = Airports.parse(airport_lines)
data_keys     = %w(identifier airport_name city country icao latitude longitude elevation timezone)

desc "Build csv file for airports api"
task :build do
  airports.each do |airport_pikelet_struct|
    airport = Airport.new(airport_pikelet_struct)
    data_keys.each_with_index do |key, i|
      if key == "latitude"
        print airport.latitude_dd
      elsif key == "longitude"
        print airport.longitude_dd
      elsif key == "country"
        print ""
      elsif key == "timezone"
        print airport.timezone.to_s
      else
        print airport.send(key)
      end
      print "," unless i == 8
    end
    puts
  end
end
