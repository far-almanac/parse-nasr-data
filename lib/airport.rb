require "timezone"
require "dotenv"
require_relative "dms_coordinate"
require_relative "geocoder-config"
require "titleize"

Dotenv.load

Timezone::Lookup.config(:google) do |c|
  c.api_key = ENV["API_KEY"]
end

class Airport
  attr_reader :latitude_dd, :longitude_dd

  def initialize(airport_pikelet_struct)
    @airport_pikelet_struct = airport_pikelet_struct
    @latitude_dd = DmsCoordinate.new_from_s(latitude).to_dd
    @longitude_dd = DmsCoordinate.new_from_s(longitude).to_dd
  end

  %w(identifier icao latitude longitude)
  .each do |deferred_method|
    define_method(deferred_method) do
      @airport_pikelet_struct.send(deferred_method)
    end
  end

  def airport_name
    @airport_pikelet_struct.airport_name.titleize
  end

  def city
    @airport_pikelet_struct.city.titleize
  end

  def country
    @country ||= geocoder_search_country
  end

  def timezone
    Timezone.lookup(latitude_dd, longitude_dd)
  end

  def elevation
    @airport_pikelet_struct.elevation.to_f.round
  end

  private

  def geocoder_search_country
    Geocoder.search("#{latitude_dd}, #{longitude_dd}")[0].country
  end
end
