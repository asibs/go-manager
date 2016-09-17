require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GoManager
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # I18n (Internationalisation) config
    I18n.enforce_available_locales = false
    I18n.config.available_locales = :en
    I18n.config.available_locales = :pirate
    I18n.default_locale = :pirate
    config.i18n.fallbacks = false
  end
end