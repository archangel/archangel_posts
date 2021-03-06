module ArchangelPosts
  class Engine < ::Rails::Engine
    require "archangel"

    isolate_namespace Archangel
    engine_name "archangel_posts"

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: false,
                       view_specs: false,
                       helper_specs: true,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    initializer "archangel_posts.configurations" do |app|
      app.config.archangel.config << ["archangel_posts"]
    end

    def self.activate
      Dir[File.join(__dir__, "../../app/**/*_decorator*.rb")].each do |klass|
        Rails.application.config.cache_classes ? require(klass) : load(klass)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
