require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyMarket
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
  
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Allow-Credentials' => true,
      'Access-Control-Request-Method' => '*',
      'Access-Control-Allow-Method' => 'GET, POST, OPTIONS, PUT, DELETE',
      'Access-Control-Allow-Headers:' => 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    }
  end
end
