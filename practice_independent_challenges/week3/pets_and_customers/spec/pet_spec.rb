require 'rspec'
require './lib/pet'

# RSpec.describe Pet do
#   before(:each) do
#     @samson = Pet.new({name: 'Samson', type: :dog, age: 3})
#   end

#   describe '#initialize' do
#     it 'exists' do
#       expect(@samson).to be_a(Pet)
#     end
    
#     it 'has a name' do
#       expect(@samson.name).to eq("Samson")
#     end

#     it 'has a type' do
#       expect(@samson.type).to eq(:dog)
#     end

#     it 'has an age' do
#       expect(@samson.age).to eq(3)
#     end
#   end

#   describe '#fed' do
#     it 'fed is set to false by default' do
#       expect(@samson.fed?).to eq(false)
#     end

#     it 'can be fed' do
#       @samson.feed
#       expect(@samson.fed?).to eq(true)
#     end
#   end
# end

RSpec.describe Pet do
  before(:each) do
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@samson).to be_a(Pet)
      expect(@samson.name).to eq("Samson")
      expect(@samson.type).to eq(:dog)
      expect(@samson.age).to eq(3)
    end
  end

  describe '#fed?' do
    it 'is false by default' do
      expect(@samson.fed?).to eq(false)
    end

    it 'can be fed' do
      @samson.feed
      expect(@samson.fed?).to eq(true)
    end
  end
end