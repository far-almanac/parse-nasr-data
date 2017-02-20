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
  airports.each do |ap|
    data_keys.each_with_index do |key, i|
      val = ap.send(key)
      if key == "latitude" || key == "longitude"
        print DmsCoordinate.new_from_s(val).to_dd
      else
        print val
      end
      print "," unless i == 8
    end
    puts
  end
end
