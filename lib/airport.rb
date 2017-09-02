require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @planes = []
  end

  def plane_land(plane)
    @planes << plane
    puts "#{plane} has landed"
    planes_count
  end

  def plane_takeoff(plane)
    fail "No planes currently in the airport" if empty?
    @planes.delete(plane)
    puts "#{plane} has left the building"
    planes_count
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

end
