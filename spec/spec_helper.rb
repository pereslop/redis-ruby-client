require 'bundler/setup'
require 'fakeredis'
require 'redis_client'
require 'byebug'
require 'redis_ruby_client/version'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
