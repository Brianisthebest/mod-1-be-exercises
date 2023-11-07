require './lib/day_care'
require './lib/customer'
require './lib/pet'

# RSpec.describe DayCare do
#   before(:each) do
#     @day_care = DayCare.new("The Dog Spot")
#   end

#   describe "Object" do
#     it "exists" do
#       expect(@day_care).to be_instance_of(DayCare)
#     end

#     it "has a name" do
#       expect(@day_care.name).to eq("The Dog Spot")
#     end

#     it "starts with no customers" do
#       expect(@day_care.customers).to eq([])
#     end
#   end

#   describe "Integrations with Pets and Customers" do
#     before(:each) do
#       @joel = Customer.new("Joel", 2)
#       @billy = Customer.new("Billy", 3)
#       @samson = Pet.new({name: "Samson", type: :dog})
#       @lucy = Pet.new({name: "Lucy", type: :cat})
#       @molly = Pet.new({name: "Molly", type: :cat})
#     end

#     it "can add customers" do
#       @day_care.add_customer(@joel)
#       @day_care.add_customer(@billy)
#       expect(@day_care.customers).to eq([@joel, @billy])
#     end

#     it "can list unfed pets" do
#       @joel.adopt(@samson)
#       @joel.adopt(@lucy)
#       @billy.adopt(@molly)

#       @day_care.add_customer(@joel)
#       @day_care.add_customer(@billy)

#       @lucy.feed

#       expect(@day_care.unfed_pets).to eq([@samson, @molly])

#     end

#     it "can find customer by id" do
#       @joel.charge(10)

#       @day_care.add_customer(@joel)
#       @day_care.add_customer(@billy)

#       expect(@day_care.customer_by_id(2)).to eq(@joel)
#     end
#   end

# end

RSpec.describe DayCare do
  before(:each) do
    @day_care = DayCare.new('PetZone')
    @joel = Customer.new("Joel", 2)
    @sophie = Customer.new("Sophie", 1)
    @dan = Customer.new("Dan", 3)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    @winston = Pet.new({name: "Winston", type: :dog, age: 2})
    @machtune = Pet.new({name: "Machtune", type: :dog, age: 13})
    @birdman = Pet.new({name: "Birdman", type: :bird, age: 7})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@day_care).to be_a(DayCare)
      expect(@day_care.name).to eq('PetZone')
      expect(@day_care.customers).to eq([])
    end
  end

  describe '#add_customer' do
    it 'can add a customer' do
      @day_care.add_customer(@joel)
      @day_care.add_customer(@sophie)
      @day_care.add_customer(@dan)
      @sophie.adopt(@winston)
      @sophie.adopt(@samson)
      @sophie.adopt(@machtune)

      expect(@day_care.customers).to eq([@joel, @sophie, @dan])
      expect(@sophie.pets).to eq([@winston, @samson, @machtune])
    end

    it 'can find a customer by id' do
      @day_care.add_customer(@joel)
      @day_care.add_customer(@sophie)
      @day_care.add_customer(@dan)

      expect(@day_care.find_customer_by_id(1)).to eq(@sophie)
      expect(@day_care.find_customer_by_id(3)).to eq(@dan)
      expect(@day_care.find_customer_by_id(4)).to eq(nil)
    end
  end

  describe '#find_unfed_pets' do
    it 'finds unfed pets' do 
      @day_care.add_customer(@sophie)
      @sophie.adopt(@winston)
      @sophie.adopt(@samson)
      @sophie.adopt(@machtune)

      expect(@day_care.find_unfed_pets).to eq([@winston, @samson, @machtune])
      @winston.feed
      expect(@day_care.find_unfed_pets).to eq([@samson, @machtune])
    end
  end

  describe '#feed_unfed_pets' do
    it 'can feed all unfed pets' do
      @day_care.add_customer(@sophie)
      @sophie.adopt(@winston)
      @sophie.adopt(@samson)
      @sophie.adopt(@machtune)
      @day_care.feed_unfed_pets
      
      expect(@day_care.find_unfed_pets).to eq([])
    end
  end
end