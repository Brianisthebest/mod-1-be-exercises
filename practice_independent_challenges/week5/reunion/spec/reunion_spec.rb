require 'rspec'
require './lib/activity'
require './lob/reunion'

RSpec.describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity = Activity.new("Brunch")
  end

  describe 'reunion' do
    it 'exists and has attributes' do
      expect(@reunion).to be_a(Reunion)
      expect(@reunion.name).to eq('1406 BE')
      expect(@reunion.activities).to eq([])
    end