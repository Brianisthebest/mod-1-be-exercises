# ./amazon_order.rb
require './lib/online_order'
class AmazonOrder
  include OnlineOrder
  
  def delivery
    "Your order will arrive in 2 business days."
  end
end
