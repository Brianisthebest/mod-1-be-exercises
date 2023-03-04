require './lib/activity'

RSpec.describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  describe 'activity' do
    it 'exists and has attributes' do
      expect(@activity).to be_a(Activity)
      expect(@activity.name).to eq('Brunch')
      expect(@activity.participant).to eq({})
    end
  end
end