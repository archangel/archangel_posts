$:.push File.expand_path("../lib", __FILE__)

require "archangel_posts/version"

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "archangel_posts"
  s.version     = ArchangelPosts::VERSION
  s.authors     = ["David Freerksen"]
  s.homepage    = "https://github.com/archangel/archangel_posts"
  s.summary     = "Summary of ArchangelPosts."
  s.description = "Description of ArchangelPosts."
  s.license     = "MIT"

  s.files = Dir[
    "{app,config,db,lib}/**/*",
    "MIT-LICENSE",
    "Rakefile",
    "README.md"
  ]

  s.required_ruby_version = ">= 2.2.2"

  s.add_dependency "archangel", "~> 0.0.1"

  s.add_development_dependency "capybara"
  s.add_development_dependency "coffee-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "poltergeist"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "selenium-webdriver"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sqlite3"
end
