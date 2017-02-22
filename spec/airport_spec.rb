require "airports"
require "airport"

RSpec.describe Airport do
  before(:all) do
    test_file = "./spec/subscription-data/APT.txt"
    all_lines = File.open(test_file)
    airport_lines = Airports.airport_lines(all_lines)
    airports = Airports.parse(airport_lines)
    airport_pikelet_struct = airports.first
    @airport = Airport.new(airport_pikelet_struct)
  end

  context "has a/an" do
    it "identifier" do
      expect(@airport.identifier).to eq("ADK")
    end

    it "airport name" do
      expect(@airport.airport_name).to eq("ADAK")
    end

    it "city" do
      expect(@airport.city).to eq("ADAK ISLAND")
    end
  end
end
