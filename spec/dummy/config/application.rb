require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

require 'api_authentication'

require 'jwt'

require 'draper'

module Dummy
  class Application < Rails::Application
    #
    # Add migrations from Engine
    #
    config.paths['db/migrate'] << '../../../db/migrate/'
  end
end
