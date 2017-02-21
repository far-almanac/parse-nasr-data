require "pikelet"

module Airports
  def self.airport_lines(all_lines)
    all_lines.select { |line| line.start_with? "APT" }
  end

  def self.parse(airport_lines)
    Pikelet.define {
      identifier       27...30
      state            50...70
      city             93...133
      airport_name    133...183
      latitude        523...537
      longitude       550...565
      icao           1210...1217
      elevation       579...585
    }
    .parse(airport_lines)
  end
end
