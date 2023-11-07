require './lib/activity'
require './lib/reunion'
require 'rspec'

RSpec.describe Reunion do
  before(:each) do
    @reunion = Reunion.new("2301 BE")

    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")
    @activity_3 = Activity.new("Bowling")

    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    
    @activity_2.add_participant("John", 80)
    @activity_2.add_participant("Maria", 20)
    @activity_2.add_participant("Luther", 40)
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@reunion).to be_a(Reunion)
      expect(@reunion.name).to eq("2301 BE")
      expect(@reunion.activities).to eq([])
    end
  end

  describe '#add_activity' do
    it 'adds activity to activities' do
      expect(@reunion.activities).to eq([])

      @reunion.add_activity(@activity_1)

      expect(@reunion.activities).to eq([@activity_1])

      @reunion.add_activity(@activity_2)

      expect(@reunion.activities).to eq([@activity_1, @activity_2])
    end
  end

  describe '#total_cost' do
    it 'returns total cost of reunion' do
      @reunion.add_activity(@activity_1)
      
      expect(@reunion.total_cost).to eq(60)
      
      @reunion.add_activity(@activity_2)

      expect(@reunion.total_cost).to eq(200)
    end
  end

  describe '#breakdown' do
    it 'returns a breakdown of what each participant owes' do
      @reunion.add_activity(@activity_1)
      @reunion.add_activity(@activity_2)
      
      expect(@reunion.breakdown).to eq({"Maria"=>36, "Luther"=>-4, "John"=>-34})
    end
  end

  describe '#summary' do
    it 'returns a summer seperating each participants name and what they owe' do
      @reunion.add_activity(@activity_1)

      expect(@reunion.summary).to eq("Maria: $10\nLuther: $-10")
    end
  end
end
