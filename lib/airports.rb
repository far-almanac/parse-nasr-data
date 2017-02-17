require "pikelet"

class Airports
  def self.parse(lines)
    definition = Pikelet.define do
      identifier       27...30
      state            50...70
      city             93...133
      name            133...183
      latitude        523...537
      longitude       550...565
      icao           1210...1217
    end
    definition.parse(lines)
  end
end
