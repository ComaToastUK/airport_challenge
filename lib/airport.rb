require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def plane_land(plane)
    fail "Landing not possible due to stormy weather" if stormy?
    fail "#{plane} not cleared to land as airport is at maximum capacity" if full?
    @planes << plane
  end

  def plane_takeoff(plane)
    fail "No planes currently in the airport" if empty?
    fail "Takeoff not possible due to stormy weather" if stormy?
    @planes.include?(plane)
    @planes.delete(plane)
  end

  def confirm_landed(plane)
    if @planes.include?(plane)
        puts "#{plane} has landed"
        planes_count
    end
  end

  def planes_count
    if @planes.count == 1
      puts "There is currently #{@planes.count} plane in the airport"
    else
      puts "There are currently #{@planes.count} planes in the airport"
    end
  end

private

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= @capacity
  end

  attr_reader :weather

  def stormy?
    weather.stormy
  end

end
