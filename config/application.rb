require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LockBox
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # set rails to serve assets
    config.serve_static_assets = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end

  module Api
    class Application < Rails::Application
      config.middleware.use Rack::Cors do
        allow do
          # TODO restrict the origins accepted, and the resources and methods that are exposed
          origins "*"
          resource "*", headers: :any, methods: [:get,
                                                 :post, :put, :delete, :options]
        end
      end
      #config.active_record.raise_in_transactional_callbacks = true
    end
  end

end
