# class Customer
#   attr_reader :name,
#               :id,
#               :pets,
#               :outstanding_balance

#   def initialize(name, id)
#     @name = name
#     @id = id
#     @pets = []
#     @outstanding_balance = 0
#   end

#   def adopt(pet)
#     @pets << pet
#   end

#   def charge(amount)
#     @outstanding_balance += amount
#   end
# end

class Customer
attr_reader :name, :id, :pets, :outstanding_balance

  def initialize(name, id)
    @name = name
    @id = id
    @pets = []
    @outstanding_balance = 0
  end

  def adopt(pet)
    @pets.push(pet)
  end

  def charge(amount)
    @outstanding_balance += amount
  end
end