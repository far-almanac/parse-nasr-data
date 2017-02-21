require "timezone"
require "dotenv"

Dotenv.load

Timezone::Lookup.config(:google) do |c|
  c.api_key = ENV["API_KEY"]
end

class Airport
  def initialize(airport_pikelet_struct)
    @airport_pikelet_struct = airport_pikelet_struct
  end

  def timezone
    "foo"
  end
end
