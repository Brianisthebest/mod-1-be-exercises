require './lib/ceo'

RSpec.describe Ceo do

  describe "setup" do
    it "exists" do
      ceo = Ceo.new(15, 20, 'John', 1)
    end
    it "has base_salary and bonus attributes" do
      ceo = Ceo.new(15, 20, 'John', 1)
      expect(ceo.base_salary).to eq(15)
      expect(ceo.bonus).to eq(20)
    end
  end

  describe "Has a name, ID, and total_compensation" do
    it ' has a name and ID' do
      ceo = Ceo.new(15, 20, 'John', 1)
      expect(ceo.is_a?Employee).to eq(true)
      expect(ceo.name).to eq('John')
      expect(ceo.id).to eq(1)
    end
    # Write tests to prove that a Ceo instance can have a Name and ID number, like any other Employee.
    it 'can have a total_compensation' do
      ceo = Ceo.new(15, 20, 'John', 1)


    end
    # Also, the CEO should be able to receive a total compensation. Write at least one test that proves they can access this method.
  end

end