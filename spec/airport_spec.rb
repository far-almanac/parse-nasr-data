require "airport"

RSpec.describe Airport do
  before(:all) do
    airport_pikelet_struct = nil
    @airport = Airport.new(airport_pikelet_struct)
  end

  it "foo" do
    expect(@airport.identifier).to eq("ADK")
  end
end
