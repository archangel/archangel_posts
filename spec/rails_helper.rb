require "simplecov"

SimpleCov.start :rails do
  add_filter "install_generator.rb"
  add_filter "version.rb"

  add_group "Policies", "app/policies"
  add_group "Uploaders", "app/uploaders"
end

ENV["RAILS_ENV"] ||= "test"

begin
  require File.expand_path("../dummy/config/environment", __FILE__)
rescue LoadError
  puts "Could not load test application. Run `bundle exec rake dummy_app` first"
  exit
end

if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end

require "spec_helper"
require "rspec/rails"

require "launchy"
require "pry-byebug"

# Local support files
Dir[Rails.root.join("../support/**/*.rb")].each { |f| require f }

# Archangel support files
require "archangel/testing_support/support"

# Required factories defined in lib/archangel_posts/factories.rb
require "archangel_posts/factories"

RSpec.configure do |config|
  config.color = true
  config.mock_with :rspec

  config.raise_errors_for_deprecations!
  config.filter_rails_from_backtrace!
  config.infer_spec_type_from_file_location!
end
