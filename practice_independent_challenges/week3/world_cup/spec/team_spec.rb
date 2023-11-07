require 'rspec'
require './lib/player'
require './lib/team'

RSpec.describe Team do
  before(:each) do
    @team = Team.new('France')
  end
    describe '#initialize' do
      it 'exists' do
        expect(@team).to be_a(Team)
      end

    it 'has a name' do
      expect(@team.country).to eq('France')
    end
  end

  describe '#eliminated?' do
    it 'checks if a team is eliminated' do
      expect(@team.eliminated?).to eq(false)
      @team.eliminated = true
      expect(@team.eliminated?).to eq(true)
    end
  end
end