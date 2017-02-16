require "pikelet"
require "pry"

data_dir = "./subscription-data"
airports_file = "#{data_dir}/APT.txt"

airport_definition = Pikelet.define do
  faa_lid 27...30
end

lines = []
File.open(airports_file).each_line do |line|
  lines << line
end

lines_airports = lines.select do |line|
  line.start_with? "APT"
end

airports = airport_definition.parse(lines_airports)
binding.pry
