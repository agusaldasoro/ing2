require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module WiFindBar
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :slim
    end
    config.encoding = 'utf-8'
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled = true
  end
end
