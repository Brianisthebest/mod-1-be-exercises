require './lib/jeep'

RSpec.describe Jeep do
  before :each do
    @jeep = Jeep.new
  end

  it 'exists' do
    expect(@jeep).to be_a(Jeep)
  end

  it 'can start' do
    expect(@jeep.start).to eq("Engine on!")
  end

  it 'can stop' do
    expect(@jeep.stop).to eq("Engine off!")
  end

  it 'can drive' do
    expect(@jeep.drive).to eq("All wheels go!")
  end

  it 'can turn the AC on' do
    expect(@jeep.turn_on).to eq('Chilly air is coming your way!')
  end

  it 'can turn the AC off' do
    expect(@jeep.turn_off).to eq('The temp is fine in here.')
  end
end
