ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

OmniAuth.config.test_mode = true
omniauth_hash = { 'provider' => 'twitter',
                  'uid' => '12345',
                  'info' => {
                    'name' => 'jhon',
                    'email' => 'jhon@doe.com',
                    'nickname' => 'jhonDoe'
                  },
                  'extra' => {'raw_info' =>
                              { 'location' => 'San Francisco',
                                'gravatar_id' => '123456789'
                              }
                  },
                  'credentials' => {
                    'token' => 'asdfqwer12345678',
                    'secret' => 'asdfqwer12345678'
                  }
}

OmniAuth.config.add_mock(:twitter, omniauth_hash)

