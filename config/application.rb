require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


# config.time_zone = 'Eastern Time (US & Canada)'
# config.active_record.default_timezone = :local

module Vtracklery20
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'
    config.active_record.default_timezone = :local
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
