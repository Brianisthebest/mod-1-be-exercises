states = {"Oregon" => "OR",
  "Alabama" => "AL",
  "New Jersey" => "NJ",
  "Colorado" => "CO"}

capitals = {"OR" => "Salem",
    "AL" => "Montgomery",
    "NJ" => "Trenton",
    "CO" => "Denver"}

    def state_abrv(states)
      states.map do |state, abrv|
        p abrv
      end
    end

    def state_caps(capitals)
      capitals.map do |arbv, capital|
        p capital
      end
    end

   p state_abrv(states)
   p state_caps(capitals)