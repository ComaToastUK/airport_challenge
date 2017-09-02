require './lib/airport'

describe Airport do
  subject(:airport) {described_class.new}

  it 'instructs a plane to land' do
  plane = Plane.new
  expect(subject.plane_land(plane)).to eq plane
  end
end
