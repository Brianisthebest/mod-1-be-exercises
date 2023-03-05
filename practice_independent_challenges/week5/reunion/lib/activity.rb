class Activity
  attr_reader :name, 
              :participants, 
              :total_cost,
              :amount_owed

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
    @amount_owed = {}
  end

  def add_participant(participant, money_paid)
    @participants[participant] = money_paid
    @total_cost += money_paid
  end

  def split
    @total_cost / @participants.length
  end
  
  def owed
    @participants.each do |participant, money_paid|
      amount_owed[participant] = split - money_paid
    end
    @amount_owed
  end
end