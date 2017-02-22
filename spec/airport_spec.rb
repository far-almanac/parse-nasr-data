require "airports"
require "airport"

RSpec.describe Airport do
  before(:all) do
    test_file = "./spec/subscription-data/APT.txt"
    all_lines = File.open(test_file)
    airport_lines = Airports.airport_lines(all_lines)
    airports = Airports.parse(airport_lines)
    airport_pikelet_struct = airports[0]
    @airport = Airport.new(airport_pikelet_struct)
    airport_pikelet_struct2 = airports[1]
    @airport2 = Airport.new(airport_pikelet_struct2)
  end

  context "has a/an" do
    it "country" do
    end

    it "timezone" do
      expect(@airport.timezone).to be_a(Timezone::Zone)
      expect(@airport.timezone.to_s).to eq("America/Adak")
      expect(@airport2.timezone.to_s).to eq("America/Chicago")
    end
  end
end
