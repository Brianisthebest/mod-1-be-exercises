require './lib/customer'
require './lib/pet'

# RSpec.describe Customer do
#   before(:each) do
#     @joel = Customer.new("Joel", 2)
#   end

#   it "exists" do
#     expect(@joel).to be_instance_of(Customer)
#   end

#   it "has attributes" do
#     expect(@joel.name).to eq("Joel")
#     expect(@joel.id).to eq(2)
#   end

#   it "starts with no pets" do
#     expect(@joel.pets).to eq([])
#   end

#   it "can adopt new pets" do
#     samson = Pet.new({name: "Samson", type: :dog})
#     lucy = Pet.new({name: "Lucy", type: :cat})

#     @joel.adopt(samson)
#     @joel.adopt(lucy)
#     expect(@joel.pets).to eq([samson, lucy])
#   end

#   it "has starting outstanding balance at 0" do
#     expect(@joel.outstanding_balance).to eq(0)
#   end

#   it "can charge to increase oustanding balance" do
#     @joel.charge(15)
#     @joel.charge(7)

#     expect(@joel.outstanding_balance).to eq(22)
#   end
# end

RSpec.describe Customer do
  before(:each) do
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@joel).to be_a(Customer)
      expect(@joel.name).to eq('Joel')
      expect(@joel.id).to eq(2)
    end
  end

  describe '#adopt' do
    it 'can add to pets array' do
      @joel.adopt(@samson)
      @joel.adopt(@lucy)

      expect(@joel.pets).to eq([@samson, @lucy])
    end
  end

  describe '#outstanding_balance' do
    it 'can return the balance and starts at 0' do
      expect(@joel.outstanding_balance).to eq(0)
    end

    it 'can charge and change outstanding balance' do
      @joel.charge(15)
      @joel.charge(7)

      expect(@joel.outstanding_balance).to eq(22)
    end
  end
end
