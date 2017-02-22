class DmsCoordinate
  attr_reader :degrees, :minutes, :seconds, :declination

  def initialize(*args)
    @degrees     = args[0]
    @minutes     = args[1]
    @seconds     = args[2]
    @declination = args[3]
  end

  def self.new_from_s(str)
    arr         = str.split("-")
    degrees     = arr[0].to_f
    minutes     = arr[1].to_f
    declination = arr[2].split("").last.to_s
    seconds     = arr[2].chop.to_f

    new(degrees, minutes, seconds, declination)
  end

  def to_dd
    (north_or_east) ? absolute_dd : -(absolute_dd)
  end

  private

  def fractional
    @minutes / 60 + @seconds / 3600
  end

  def absolute_dd
    @degrees + fractional
  end

  def north_or_east
    %w{N E}.include?(@declination)
  end
end
