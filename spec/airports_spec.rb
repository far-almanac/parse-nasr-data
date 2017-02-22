require "airports"

RSpec.describe Airports do
  before(:all) do
    test_file = "./spec/subscription-data/APT.txt"
    @all_lines = File.open(test_file)
    @airport_lines = Airports.airport_lines(@all_lines)
    @airports = Airports.parse(@airport_lines)
    @airport = @airports.first
  end

  context "airport lines" do
    it "separates them from the rest of the lines" do
      expect(@airport_lines.first.to_s.start_with?("APT")).to eq(TRUE)
    end
  end

  context "parses" do
    it "the identifier" do
      expect(@airport.identifier).to eq("ADK")
    end

    it "the icao identifier" do
      expect(@airport.icao).to eq("PADK")
    end

    it "the state" do
      expect(@airport.state).to eq("ALASKA")
    end

    it "the city" do
      expect(@airport.city).to eq("ADAK ISLAND")
    end

    it "the elevation" do
      expect(@airport.elevation).to eq("19.5")
      expect(@airport.elevation.to_f).to eq(19.5)
    end
  end
end
