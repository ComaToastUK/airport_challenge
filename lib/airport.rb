require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize(weather: Weather.new)
    @planes = []
    @weather = weather
  end

  def plane_land(plane)
    fail "Landing not possible due to stormy weather" if stormy?
    @planes << plane
  end

  def plane_takeoff(plane)
    fail "No planes currently in the airport" if empty?
    @planes.include?(plane)
    @planes.delete(plane)
  end

private

  def empty?
    @planes.empty?
  end

  def planes_count
    if @planes.count == 1
      puts "There is currently #{@planes.count} plane in the airport"
    else
      puts "There are currently #{@planes.count} planes in the airport"
    end
  end

  def weather
    @weather
  end

  def stormy?
    weather.stormy
  end

end
