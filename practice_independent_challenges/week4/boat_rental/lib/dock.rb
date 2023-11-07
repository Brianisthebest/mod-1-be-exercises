class Dock
  attr_reader :name, 
              :max_rental_time, 
              :rental_log,
              :charge_hash,
              :total_rev
  
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @charge_hash = {}
    @total_reve = 0
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
    boat.add_hour
  end

  def charge(rented_boat)
    if rented_boat.hours_rented > @max_rental_time
      total_charged = rented_boat.price_per_hour * @max_rental_time
    else
      total_charged = rented_boat.price_per_hour * rented_boat.hours_rented
    end
    cc_num = @rental_log.select do |boat, renter|
      if boat.type == rented_boat.type
        charge_hash[:card_number] = renter.credit_card_number
      end
    end
    charge_hash[:amount] = total_charged
    charge_hash
  end

  def return(returned_boat)
    @rental_log.each do |boat, renter|
      if boat.type == returned_boat.type
        charge(returned_boat)
        @rental_log.delete(boat)
      end
    end
    @rental_log
  end

  def log_hour
    @rental_log.each do |boat, renter|
      if boat.hours_rented < @max_rental_time
        boat.add_hour
      end
    end
  end

  def revenue
    @charge_hash.each do |card_num, amount|
      if card_num == :amount
        # require 'pry'; binding.pry
        @total_rev += amount
      else
        @total_rev
      end
    end
  end
  @total_rev
end
