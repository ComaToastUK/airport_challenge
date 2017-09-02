require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @planes = []
  end

  def plane_land(plane)
    @planes << plane
  end

  def plane_takeoff(plane)
    @planes.delete(plane)
    puts "#{plane} has left the building"
  end

end
