require './lib/activity'
require 'rspec'

RSpec.describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@activity).to be_a(Activity)
      expect(@activity.name).to eq("Brunch")
      expect(@activity.participants).to eq({})
    end
  end

  describe '#add_participant' do
    it 'adds participant to participants' do
      @activity.add_participant("Maria", 20)

      expect(@activity.participants).to eq({"Maria" => 20})
    end
  end

  describe '#total_cost' do
    it 'returns total cost of activity' do
      expect(@activity.total_cost).to eq(0)

      @activity.add_participant("Maria", 20)

      expect(@activity.total_cost).to eq(20)

      @activity.add_participant("Luther", 40)

      expect(@activity.total_cost).to eq(60)
    end
  end

  describe '#split' do
    it 'returns the split cost of the activity' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.total_cost).to eq(60)
      expect(@activity.split).to eq(30)
    end
  end
  
  describe '#owed' do
    it 'returns the amount owed by each participant' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      
      expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end
end