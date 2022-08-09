class ProductChannel < ApplicationCable::Channel

  def subscribed
  	stream_from "product_channel"
  end
end