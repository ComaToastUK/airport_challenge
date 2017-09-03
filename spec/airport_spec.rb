require './lib/airport'

describe Airport do

  subject(:airport) { described_class.new }

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
  describe '#plane_takeoff' do
    it 'instructs a plane to take off' do
      plane = Plane.new
      subject.plane_land(plane)
      expect(subject.plane_takeoff(plane)).to eq plane
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  it 'passes an error on takeoff when weather is stormy' do
    plane = Plane.new
      expect { airport.plane_takeoff(plane) }.to raise_error "Takeoff not possible due to stormy weather"
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy

  it 'passes an error on landing when weather is stormy' do
    plane = Plane.new
      expect { airport.plane_land(plane) }.to raise_error "Landing not possible due to stormy weather"
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  it 'passes an error when the airport is full' do
      5.times do subject.plane_land(Plane.new)
      expect {subject.plane_land(Plane.new)}.to raise_error "#{plane} not cleared to land as airport is at maximum capacity"
    end
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

end
