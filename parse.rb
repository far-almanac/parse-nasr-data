require "pikelet"
require "pry"
require "./lib/airports.rb"

data_dir = "./subscription-data"
airports_file = "#{data_dir}/APT.txt"

lines = []
File.open(airports_file).each_line do |line|
  lines << line
end

lines_airports = lines.select do |line|
  line.start_with? "APT"
end

airports = Airports.parse(lines_airports)

puts airports.select { |ap| ap.icao }
