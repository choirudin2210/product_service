# frozen_string_literal: true
require 'sidekiq'


Sidekiq.configure_server do |config|
  config.redis = {url: ENV.fetch("SIDEKIQ_REDIS_URL", "redis://localhost:6379/0"), network_timeout: 5}
end

Sidekiq.configure_client do |config|
  config.redis = {url: ENV.fetch("SIDEKIQ_REDIS_URL", "redis://localhost:6379/0"), network_timeout: 5}
end