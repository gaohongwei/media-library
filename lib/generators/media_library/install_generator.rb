module MediaLibrary
  class InstallGenerator < Rails::Generators::Base
    source_root(File.expand_path("../templates", __FILE__))
    
    def add_initializer
      template "initializer.rb", "config/initializers/media_library_initializer.rb"
    end

    def mount_media_library_in_routes
     inject_into_file("config/routes.rb", "\s\smount MediaLibrary::Engine, at: '/media_library'\n", :after => "::Application.routes.draw do\n")
    end

    def insert_javascripts
      append_to_file("app/assets/javascripts/application.js", "//= require media_library\n")
    end

    def show_readme
      readme "README"
    end
  end
end
