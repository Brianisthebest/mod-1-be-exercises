require 'rspec'
require './lib/activity'

RSpec.describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  describe 'activity' do
    it 'exists and has attributes' do
      expect(@activity).to be_a(Activity)
      expect(@activity.name).to eq('Brunch')
      expect(@activity.participants).to eq({})
    end

    it 'can add participants' do
      @activity.add_participant('Maria', 20)
      expect(@activity.participants).to eq({'Maria' => 20})
      expect(@activity.total_cost).to eq(20)

      @activity.add_participant("Luther", 40)
      expect(@activity.participants).to eq({'Maria' => 20, 'Luther' => 40})
    end

    it 'can split the cost across participants' do
      @activity.add_participant('Maria', 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.total_cost).to eq(60)
      expect(@activity.split).to eq(30)
    end

    it 'calculates owed money' do
      @activity.add_participant('Maria', 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.split).to eq(30)
      
      expect(@activity.owed).to eq('Maria' => 10, 'Luther' => -10)
    end
  end
end