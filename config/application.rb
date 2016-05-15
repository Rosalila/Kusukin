require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)
load 'lib/configus.rb'

module App
  class Application < Rails::Application
    config.to_prepare do
      Devise::SessionsController.layout 'frontend/homepage'
      Devise::RegistrationsController.layout 'frontend/homepage'
      Devise::ConfirmationsController.layout 'frontend/homepage'
      Devise::UnlocksController.layout 'frontend/homepage'
      Devise::PasswordsController.layout 'frontend/homepage'
    end

    config.active_record.raise_in_transactional_callbacks = true
  end
end
