require 'api_authentication/configuration'
require 'api_authentication/engine'
require 'apidocs/session_docs'
# require 'validators'
require 'email_validator'

module ApiAuthentication
  autoload :EmailValidator, 'email_validator'
  autoload :HeaderAuthFinder, 'api_authentication/header_auth_finder'
  autoload :RefreshAuthorizer, 'api_authentication/refresh_authorizer'
  autoload :RequestAuthorizer, 'api_authentication/request_authorizer'
  autoload :UserAuthenticator, 'api_authentication/user_authenticator'

  module JsonWebToken
    autoload :Access, 'api_authentication/json_web_token/access'
    autoload :Base, 'api_authentication/json_web_token/base'
    autoload :Creator, 'api_authentication/json_web_token/creator'
    autoload :Refresh, 'api_authentication/json_web_token/refresh'
  end

  SWAGGER_CLASSES = [
    ::ApiAuthentication::SessionDocs
  ]

  def self.configure(&block)
    block.call configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.user_model
    configuration.app_user_model_class_name.constantize
  end
end
