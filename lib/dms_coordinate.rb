class DmsCoordinate
  attr_reader :degrees, :minutes, :seconds, :declination

  def initialize(*args)
    @degrees     = args[0]
    @minutes     = args[1]
    @seconds     = args[2]
    @declination = args[3]
  end

  def to_dd
		fractional = ( @minutes / 60 + @seconds / 3600 )
    if @declination == "N" || @declination == "E"
		  @degrees + fractional
    else
      @degrees - fractional
    end
  end

  def self.new_from_s(str)
    arr         = str.split("-")
    degrees     = arr[0].to_f
    minutes     = arr[1].to_f
    declination = arr[2].split("").last.to_s
    seconds     = arr[2].chop.to_f

    new(degrees, minutes, seconds, declination)
  end
end
