class Reunion
  attr_reader :name,
              :activities,
              :total_reunion_cost

  def initialize(name)
    @name = name
    @activities = []
    @total_reunion_cost = 0
    @reunion_amount_owed = Hash.new(0)
  end

  def add_activity(activity)
    @activities.push(activity)
  end

  def total_cost
    @activities.each do |activity|
      @total_reunion_cost += activity.total_cost
    end
    @total_reunion_cost
  end

  def total_owed
    @activities.each do |activity|
      activity.owed.each do |name, amount|
        @reunion_amount_owed[name] += amount
      end
    end
    @reunion_amount_owed
  end
end