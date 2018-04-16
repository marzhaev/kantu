require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kantu
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    @mongodb_client = Mongo::Client.new(
      'mongodb+srv://texenergo_ro:1HqJn9MKSIsWLKVc@cluster0-ddup8.mongodb.net/production_v3',
      app_name: "kantu-#{Rails.env}"
    )
  end
end

def products_db
  WwwTexenergo::Application.instance_variable_get(:@mongodb_client)[:products]
end

def product_properties_db
  WwwTexenergo::Application.instance_variable_get(:@mongodb_client)[:product_meta]
end
