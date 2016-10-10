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

  s.files       = `git ls-files`.split($\)

  s.required_ruby_version = ">= 2.2.2"

  s.add_dependency "archangel", "~> 0.0.1"
end
