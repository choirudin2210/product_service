class Product < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :category

  has_one_attached :image
  after_create :do_something
  after_save :send_is_active_watch_email

  def active!
  	self.is_active = true
  	save!
  end

  def send_is_active_watch_email
    if is_active_previously_changed?
      ProductMailer.with(product: self).is_active_watch_email.deliver_now
    end
  end


  def do_something
    activate
    broadcast_product
  end

  def activate
    ActivateProductJob.set(wait: 3.minutes).perform_later self
  end

  def broadcast_product
    ActionCable.server.broadcast('product-channel', message: self)
  end

end
