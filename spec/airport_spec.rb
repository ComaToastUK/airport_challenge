require './lib/airport'

describe Airport do
  subject(:airport) {described_class.new}

  it 'instructs a plane to land' do
  plane = Plane.new
  expect{plane.plane_land}.to eq plane
  end
end
