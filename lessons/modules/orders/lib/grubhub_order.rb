# ./grubhub_order.rb
require './lib/online_order'
class GrubhubOrder
  include OnlineOrder

  def delivery
    "Your food will arrive in 45-60 minutes."
  end
end
