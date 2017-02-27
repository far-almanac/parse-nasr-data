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
    airport_pikelet_struct3 = airports[2]
    @airport3 = Airport.new(airport_pikelet_struct3)
  end

  context "has a/an" do
    context "country" do
      it "of United States" do
        expect(@airport.country).to eq("United States")
        expect(@airport2.country).to eq("United States")
      end

      it "of The Bahamas" do
        expect(@airport3.country).to eq("The Bahamas")
      end
    end

    context "timezone" do
      it "and returns s Timezone::Zone object" do
        expect(@airport.timezone).to be_a(Timezone::Zone)
      end

      it "and finds America/Adak timezone" do
        expect(@airport.timezone.to_s).to eq("America/Adak")
      end

      it "and finds America/Chicago timezone" do
        expect(@airport2.timezone.to_s).to eq("America/Chicago")
      end
    end
  end
end
