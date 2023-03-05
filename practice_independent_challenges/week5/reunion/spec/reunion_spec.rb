require 'rspec'
require './lib/activity'
require './lib/reunion'

RSpec.describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new('Drinks')

  end

  describe 'reunion' do
    it 'exists and has attributes' do
      expect(@reunion).to be_a(Reunion)
      expect(@reunion.name).to eq('1406 BE')
      expect(@reunion.activities).to eq([])
    end

    it 'can add activities' do
      @reunion.add_activity(@activity_1)
      expect(@reunion.activities).to eq([@activity_1])
      @reunion.add_activity(@activity_2)
      expect(@reunion.activities).to eq([@activity_1, @activity_2])
    end
    
    it 'can tell the total cost of event' do
      @reunion.add_activity(@activity_1)
      @reunion.add_activity(@activity_2)
      @activity_1.add_participant('Maria', 20)
      @activity_1.add_participant("Luther", 40)
      @activity_2.add_participant('Maria', 40)
      @activity_2.add_participant("Luther", 50)

      expect(@reunion.total_cost).to eq(150)
    end
    
    it 'provides a list of participants and what they owe' do
      @reunion.add_activity(@activity_1)
      @reunion.add_activity(@activity_2)
      @activity_1.add_participant('Maria', 20)
      @activity_1.add_participant("Luther", 40)
      @activity_2.add_participant('Maria', 40)
      @activity_2.add_participant("Luther", 50)

      expect(@reunion.total_owed).to eq({'Maria' => 15, 'Luther' => -15})
    end

    it 'can print a summary of hash above and sep by line break' do
      @reunion.add_activity(@activity_1)
      @reunion.add_activity(@activity_2)
      @activity_1.add_participant('Maria', 20)
      @activity_1.add_participant("Luther", 40)
      @activity_2.add_participant('Maria', 40)
      @activity_2.add_participant("Luther", 50)
      expect(@reunion.total_owed).to eq({'Maria' => 15, 'Luther' => -15})
      expect(@reunion.summary).to eq('Maria: $15\nLuther: $-15')
    end
  end
end