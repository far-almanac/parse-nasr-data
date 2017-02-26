require_relative "lib/airport"
require_relative "lib/airports"
require_relative "lib/dms_coordinate"

data_dir      = "./subscription-data"
airports_file = "#{data_dir}/APT.txt"
all_lines     = File.open(airports_file)
airport_lines = Airports.airport_lines(all_lines)
airports      = Airports.parse(airport_lines)
data_keys     = %w(identifier airport_name city country icao latitude longitude elevation timezone)

def airports_count_start_with(airports, sw)
  print "ICAO starts with \"#{sw}\": "
  puts airports.select { |ap| ap.icao.start_with?(sw) }.count
end

def total_airports(airports)
  puts "total airports: #{airports.count}"
end

def no_icao(airports)
  x = airports.select { |ap| ap.icao.length == 0 }.count
  puts "no ICAO: #{x}"
end

task :foo do
  airports_count_start_with(airports, "K")
  airports_count_start_with(airports, "P")
  airports_count_start_with(airports, "M")
  airports_count_start_with(airports, "C")
  no_icao(airports)
  total_airports(airports)
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
