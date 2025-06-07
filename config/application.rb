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
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QuotetyApi
  class Application < Rails::Application
    config.load_defaults 7.2
    config.i18n.default_locale = :fr


    config.autoload_lib(ignore: %w[assets tasks])

    # ❌ Supprimer le mode API-only
    config.api_only = false

    # ✅ Ajoute manuellement le middleware de session & cookies
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use ActionDispatch::Flash

    # Optionnel : set default time zone, locale, etc.
    # config.time_zone = "Paris"
  end
end
