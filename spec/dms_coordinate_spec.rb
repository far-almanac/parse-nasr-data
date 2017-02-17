require "dms_coordinate"

RSpec.describe DmsCoordinate do
  before(:all) do
    @coord1 = DmsCoordinate.new_from_s("39-06-51.0701N")
  end

  context "from a string" do
    it "parses degrees from a gps coordinate" do
      expect(@coord1.degrees).to eq 39
    end

    it "parses minutes from a gps coordinate" do
      expect(@coord1.minutes).to eq 6
    end

    it "parses seconds from a gps coordinate" do
      expect(@coord1.seconds).to eq 51.0701
    end

    it "parses declination from a gps coordinate" do
      expect(@coord1.declination).to eq "N"
    end
  end

  context "conversion" do
    it "converts to decimal degrees" do
      expect(@coord1.to_dd).to eq 39.11418613888889
    end
  end
end
