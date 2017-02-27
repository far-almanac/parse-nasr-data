require "dotenv"
require "geocoder"

Dotenv.load

Geocoder.configure(
  use_https: true,
  api_key:   ENV["API_KEY"]
)
