require './lib/airport'

describe Airport do
  subject(:airport) {described_class.new}

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport

  it 'instructs a plane to land' do
  plane = Plane.new
  expect(subject.plane_land(plane)).to eq [plane]
  end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and
# confirm that it is no longer in the airport

  it 'instructs a plane to take off' do
  plane = Plane.new
  expect(subject.plane_takeoff(plane)).to eq nil
  end

  it 'confirms that the plane has left the airport' do
  plane = Plane.new
  expect(subject.plane_takeoff(plane)).to eq "#{plane} has left the building"
  end

end
