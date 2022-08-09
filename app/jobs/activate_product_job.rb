class ActivateProductJob < ApplicationJob
  sidekiq_options queue: :default, retry: 3
  queue_as :default

  def perform(product)
    # Do something later
    product.active!
  end
end
