class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum(&:total_cost)
    # @activities.sum do |activity|
    #   activity.total_cost
    # end
  end

  def breakdown
    breakdown_hash = Hash.new(0)

    @activities.each do |activity|
      activity.owed.each do |name, amount_owed|
        breakdown_hash[name] += amount_owed
      end
    end
    breakdown_hash
  end

  def summary
    summary = []
    
    self.breakdown.each do |name, amount_owed|
      summary << "#{name}: $#{amount_owed}"
    end
    summary.join("\n")
  end
end