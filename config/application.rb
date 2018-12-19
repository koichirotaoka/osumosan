require_relative 'boot'

require 'rails/all'
#config.assets.initialize_on_precompile = false


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Osumosan
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    
    #追加
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    
    config.i18n.default_locale = :ja
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]  
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end


