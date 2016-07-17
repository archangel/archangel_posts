require "simplecov"

SimpleCov.start :rails do
  add_filter "install_generator.rb"
  add_filter "version.rb"

  add_group "Policies", "app/policies"
  add_group "Uploaders", "app/uploaders"
end
