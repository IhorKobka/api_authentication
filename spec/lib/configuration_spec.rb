# frozen_string_literal: true

require 'rails_helper'

describe ApiAuthentication::Configuration do
  its(:controller_to_inherit_from) { should eq 'ActionController::Base' }

  its(:registration_fields) { should eq %i[email first_name last_name username birthday avatar] }

  its(:registrations) { should eq true }
  its(:push_tokens) { should eq true }
  its(:sessions) { should eq true }
  its(:facebook_login) { should eq true }

  its(:app_user_model_class_name) { should eq 'User' }
  its(:app_refresh_token_model_class_name) { should eq 'RefreshToken' }
  its(:app_push_token_model_class_name) { should eq 'PushToken' }

  its(:user_fields) { should eq %i[email first_name last_name username birthday avatar] }

  its(:secret_key) { should eq '<%= SecureRandom.hex(64) %>' }

  its(:jwt_token_exp) { should eq 1.hour }
  its(:refresh_token_exp) { should eq 1.month }
end
