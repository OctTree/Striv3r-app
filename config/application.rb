require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Striv3r
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.middleware.use ActionDispatch::Flash
    config.eager_load_paths << Rails.root.join('lib')

    #CORS CONFIG
    config.middleware.insert_before 0, Rack::Cors do
      ALLOWED_CLIENTS = %i[localhost:3000 localhost:5000 nameless-bastion-40989.herokuapp.com] + [ENV['CORS_CLIENTS']&.split(',')]

      ALLOWED_CLIENTS.compact.each do |client|
        allow do
          origins client
          resource '*',
                   headers: :any,
                   credentials: true,
                   methods: :any
        end
      end
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
