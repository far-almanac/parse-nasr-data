require "dotenv"
require "timezone"

Dotenv.load

Timezone::Lookup.config(:google) do |c|
  c.api_key = ENV["API_KEY"]
end
