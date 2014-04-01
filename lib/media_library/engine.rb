module MediaLibrary
  class Engine < ::Rails::Engine
    isolate_namespace MediaLibrary

    # initializer :append_migrations do |app|
    #   app.config.paths["db/migrate"] += config.paths["db/migrate"].expanded unless app.root.to_s.match root.to_s
    # end

    config.generators do |g|
      g.test_framework :rspec, view_specs: false
      g.integration_tool :rspec
      g.fixture_replacement :factory_girl
      g.stylesheets     false
      g.javascripts     false
      g.helper          false
      g.assets          false
    end

  end
end
