ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

Capybara.default_driver = :webkit

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  # Make sure not rollback on finish every case
  # Change from webkit will be commited in any case.
  # So, we clean table with database rewinder.
  self.use_transactional_fixtures = false

  def teardown_with_global
    teardown_without_global
    DatabaseRewinder.clean
  end
  alias_method_chain :teardown, :global

  private
  def sign_in(user = 'user', email = '')
    OmniAuth.config.mock_auth[:development] = OmniAuth::AuthHash.new provider: 'development', uid: 'test_mock_user', info: {
      name: user,
      email: email
    }
    visit '/auth/developer'
  end

  def sign_out()
    visit '/sessions/destroy'
  end
end
