ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'helpers/request_helper'

class ActiveSupport::TestCase
  fixtures :all

  include Devise::TestHelpers
  include RequestHelper
end
