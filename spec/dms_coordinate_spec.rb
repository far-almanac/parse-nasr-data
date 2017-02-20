require "dms_coordinate"

RSpec.describe DmsCoordinate do
  before(:all) do
    @c = [
      "39-06-51.0701N",
      "012-00-13.9694W",
      "014-12-00.0000W",
      "39-06-51.0701S"
    ].collect { |c| DmsCoordinate.new_from_s(c) }
  end

  context "from a string" do
    it "parses degrees from a gps coordinate" do
      expect(@c[0].degrees).to eq 39
      expect(@c[1].degrees).to eq 12
    end

    it "parses minutes from a gps coordinate" do
      expect(@c[0].minutes).to eq 6
      expect(@c[1].minutes).to eq 0
    end

    it "parses seconds from a gps coordinate" do
      expect(@c[0].seconds).to eq 51.0701
      expect(@c[1].seconds).to eq 13.9694
    end

    it "parses declination from a gps coordinate" do
      expect(@c[0].declination).to eq "N"
      expect(@c[1].declination).to eq "W"
    end
  end

  context "conversion" do
    it "converts to decimal degrees" do
      expect(@c[0].to_dd).to be_within(0.00001).of(39.11418613888889)
      expect(@c[1].to_dd).to be_within(0.00001).of(-12.00388)
      expect(@c[2].to_dd).to be_within(0.00001).of(-14.2)
      expect(@c[3].to_dd).to be_within(0.00001).of(-39.11418613888889)
    end
  end
end
