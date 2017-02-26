require_relative "lib/airport"
require_relative "lib/airports"
require_relative "lib/dms_coordinate"

data_dir      = "./subscription-data"
airports_file = "#{data_dir}/APT.txt"
all_lines     = File.open(airports_file)
airport_lines = Airports.airport_lines(all_lines)
airports      = Airports.parse(airport_lines)
data_keys     = %w(identifier airport_name city country icao latitude longitude elevation timezone)

def indent(str)
  '%12s' % str
end

task :foo do
  p = []
  k = []
  m = []
  c = []
  n = [] # no ICAO
  airports.each do |airport_pikelet_struct|
    a = airport_pikelet_struct
    p << a if a.icao.start_with? "P"
    k << a if a.icao.start_with? "K"
    m << a if a.icao.start_with? "M"
    c << a if a.icao.start_with? "C"
    n << a if a.icao.length > 0
  end
  t = p + k + m + c
  puts "K     #{indent(k.count)}"
  puts "P     #{indent(p.count)}"
  puts "M     #{indent(m.count)}"
  puts "C     #{indent(c.count)}"
  puts "N     #{indent(n.count)}"
  puts "------------------"
  puts "TOTAL #{indent(t.count)}"
  puts "------------------"
  puts "GTOTAL#{indent(airports.count)}"
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
