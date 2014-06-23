# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "media_library"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["General Things"]
  s.date = "2013-04-25"
  s.description = "Simple framework for uploading and organizing assets"
  s.email = ["dev@generalthings.com"]
  s.files = ["app/models", "app/models/media_library", "app/models/media_library/document.rb", "app/models/media_library/url_uploader.rb", "app/models/media_library/variation.rb", "app/models/media_library/hosted_video.rb", "app/models/media_library/gallery.rb", "app/models/media_library/gallery_profile.rb", "app/models/media_library/uploader.rb", "app/models/media_library/profile.rb", "app/models/media_library/video.rb", "app/models/media_library/image.rb", "app/models/media_library/linked.rb", "app/models/media_library/document_image.rb", "app/models/media_library/custom_exceptions.rb", "app/helpers", "app/helpers/media_library", "app/helpers/media_library/uploadables_controller_helper.rb", "app/helpers/media_library/buckets_helper.rb", "app/helpers/media_library/application_helper.rb", "app/helpers/media_library/items_helper.rb", "app/views", "app/views/layouts", "app/views/layouts/media_library", "app/views/layouts/media_library/application.html.haml", "app/views/layouts/application.html.haml", "app/views/media_library", "app/views/media_library/uploads", "app/views/media_library/uploads/create.html.erb", "app/views/media_library/items", "app/views/media_library/items/new.html.haml", "app/views/media_library/items/_form.html.haml", "app/views/media_library/items/_title_fields.html.haml", "app/views/media_library/items/_tag_fields.html.haml", "app/views/media_library/items/_gallery_fields.html.haml", "app/views/media_library/items/_image_fields.html.haml", "app/views/media_library/items/edit.html.haml", "app/views/media_library/items/_file_fields.html.haml", "app/views/media_library/items/index.html.haml", "app/views/media_library/items/_variation_fields.html.haml", "app/views/media_library/searches", "app/views/media_library/searches/_search_bar.html.haml", "app/views/media_library/searches/index.html.haml", "app/views/media_library/galleries", "app/views/media_library/galleries/new.html.haml", "app/views/media_library/galleries/show.html.haml", "app/views/media_library/galleries/edit.html.haml", "app/views/media_library/galleries/index.html.haml", "app/controllers", "app/controllers/media_library", "app/controllers/media_library/base_controller.rb", "app/controllers/media_library/uploads_controller.rb", "app/controllers/media_library/searches_controller.rb", "app/controllers/media_library/items_controller.rb", "app/controllers/media_library/variations_controller.rb", "app/controllers/media_library/galleries_controller.rb", "app/presenters", "app/presenters/media_library", "app/presenters/media_library/uploads_presenter.rb", "app/uploaders", "app/uploaders/media_library", "app/uploaders/media_library/video_uploader.rb", "app/uploaders/media_library/image_uploader.rb", "app/uploaders/media_library/document_uploader.rb", "app/uploaders/media_library/base_uploader.rb", "app/assets", "app/assets/images", "app/assets/images/media_library", "app/assets/javascripts", "app/assets/javascripts/media_library", "app/assets/javascripts/media_library/item_url_upload.js.coffee", "app/assets/javascripts/media_library/item_upload.js", "app/assets/javascripts/media_library.js", "app/assets/stylesheets", "app/assets/stylesheets/media_library", "app/assets/stylesheets/media_library/application.css", "config/routes.rb", "config/initializers", "config/initializers/active_record_extensions.rb", "db/migrate", "db/migrate/20130327001656_create_media_library_variations.rb", "db/migrate/20130327175131_add_document_id_to_media_library_variations.rb", "db/migrate/20121214175733_add_user_to_profile.rb", "db/migrate/20121204203515_change_item_profiles_to_profiles.rb", "db/migrate/20130326213803_add_embed_url_to_media_library_hosted_videos.rb", "db/migrate/20121203215058_create_media_library_linkeds.rb", "db/migrate/20121203214834_create_media_library_images.rb", "db/migrate/20130329215449_add_active_to_media_library_variations.rb", "db/migrate/20130328165608_add_title_from_media_library_documents.rb", "db/migrate/20130320210518_add_thumbnail_url_to_media_library_hosted_videos.rb", "db/migrate/20130302004125_create_media_library_gallery_profiles.rb", "db/migrate/20130328185508_add_index_to_media_library_galleries.rb", "db/migrate/20121204195321_acts_as_taggable_on_migration.rb", "db/migrate/20121203220917_create_media_library_documents.rb", "db/migrate/20130330001056_add_default_to_active_to_media_library_variations.rb", "db/migrate/20130402004358_remove_language_from_media_library_variations.rb", "db/migrate/20130327233838_add_size_to_media_library_variations.rb", "db/migrate/20130405170607_fix_indexes_for_media_library_profiles.rb", "db/migrate/20130301020042_create_media_library_galleries.rb", "db/migrate/20121203220114_create_media_library_vimeos.rb", "db/migrate/20130110174018_add_alt_tag_to_media_library_linkeds.rb", "db/migrate/20130328184730_add_index_to_media_library_profiles.rb", "db/migrate/20130110173144_rename_media_l_library_linkeds_type_column.rb", "db/migrate/20130328165400_remove_field_from_media_library_documents.rb", "db/migrate/20121201020559_create_media_library_item_profiles.rb", "db/migrate/20121203220927_create_media_library_videos.rb", "db/migrate/20121203220107_create_media_library_you_tubes.rb", "db/migrate/20130110103333_add_fields_to_media_library_linked.rb", "db/migrate/20130327182844_add_default_value_to_media_library_variations.rb", "db/migrate/20130328234438_rename_media_library_documents_title_to_name.rb", "db/migrate/20121206194042_add_active_to_profile.rb", "db/migrate/20130320204140_create_media_library_hosted_videos.rb", "lib/tasks", "lib/tasks/media_library_tasks.rake", "lib/media_library.rb", "lib/media_library", "lib/media_library/configuration.rb", "lib/media_library/engine.rb", "lib/media_library/version.rb", "lib/media_library/has_profile.rb", "lib/media_library/custom_exceptions.rb", "lib/generators", "lib/generators/media_library", "lib/generators/media_library/install_generator.rb", "lib/generators/media_library/views_generator.rb", "lib/generators/media_library/templates", "lib/generators/media_library/templates/README", "lib/generators/media_library/templates/initializer.rb", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.homepage = "http://generalthings.com"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Organize assets"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<acts-as-taggable-on>, ["~> 2.4.1"])
      s.add_runtime_dependency(%q<bootstrap-sass>, ["~> 2.3.1.0"])
      s.add_runtime_dependency(%q<carrierwave>, ["~> 0.6.2"])
      s.add_runtime_dependency(%q<coffee-rails>, ["~> 3.2.1"])
      s.add_runtime_dependency(%q<ejs>, ["= 1.0.0"])
      s.add_runtime_dependency(%q<execjs>, [">= 1.2.9"])
      s.add_runtime_dependency(%q<haml_assets>, ["= 0.1.0"])
      s.add_runtime_dependency(%q<haml_coffee_assets>, ["= 1.1.2"])
      s.add_runtime_dependency(%q<haml-rails>, ["= 0.4"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<mini_magick>, ["= 3.2.1"])
      s.add_runtime_dependency(%q<plupload-rails>, ["= 1.0.6"])
      s.add_runtime_dependency(%q<rails>, ["~> 3.2.8"])
      s.add_runtime_dependency(%q<rmagick>, ["= 2.13.1"])
      s.add_runtime_dependency(%q<sass-rails>, ["~> 3.2.3"])
      s.add_runtime_dependency(%q<tire>, ["~> 0.4.3"])
      s.add_runtime_dependency(%q<will_paginate>, [">= 0"])
      s.add_development_dependency(%q<better_errors>, [">= 0"])
      s.add_development_dependency(%q<binding_of_caller>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, ["= 0.8.0"])
      s.add_development_dependency(%q<debugger>, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>, ["= 3.5.0"])
      s.add_development_dependency(%q<faker>, ["= 1.0.1"])
      s.add_development_dependency(%q<nyan-cat-formatter>, [">= 0"])
      s.add_development_dependency(%q<mysql2>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.12"])
      s.add_development_dependency(%q<shoulda-matchers>, [">= 0"])
    else
      s.add_dependency(%q<acts-as-taggable-on>, ["~> 2.3.1"])
      s.add_dependency(%q<bootstrap-sass>, ["~> 2.0.4.2"])
      s.add_dependency(%q<carrierwave>, ["~> 0.6.2"])
      s.add_dependency(%q<coffee-rails>, ["~> 3.2.1"])
      s.add_dependency(%q<ejs>, ["= 1.0.0"])
      s.add_dependency(%q<execjs>, [">= 1.2.9"])
      s.add_dependency(%q<haml_assets>, ["= 0.1.0"])
      s.add_dependency(%q<haml_coffee_assets>, ["= 1.1.2"])
      s.add_dependency(%q<haml-rails>, ["= 0.4"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<mini_magick>, ["= 3.2.1"])
      s.add_dependency(%q<plupload-rails>, ["= 1.0.6"])
      s.add_dependency(%q<rails>, ["~> 3.2.8"])
      s.add_dependency(%q<rmagick>, ["= 2.13.1"])
      s.add_dependency(%q<sass-rails>, ["~> 3.2.3"])
      s.add_dependency(%q<tire>, ["~> 0.4.3"])
      s.add_dependency(%q<will_paginate>, [">= 0"])
      s.add_dependency(%q<better_errors>, [">= 0"])
      s.add_dependency(%q<binding_of_caller>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, ["= 0.8.0"])
      s.add_dependency(%q<debugger>, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>, ["= 3.5.0"])
      s.add_dependency(%q<faker>, ["= 1.0.1"])
      s.add_dependency(%q<nyan-cat-formatter>, [">= 0"])
      s.add_dependency(%q<mysql2>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.12"])
      s.add_dependency(%q<shoulda-matchers>, [">= 0"])
    end
  else
    s.add_dependency(%q<acts-as-taggable-on>, ["~> 2.4.1"])
    s.add_dependency(%q<bootstrap-sass>, ["~> 2.3.1.0"])
    s.add_dependency(%q<carrierwave>, ["~> 0.6.2"])
    s.add_dependency(%q<coffee-rails>, ["~> 3.2.1"])
    s.add_dependency(%q<ejs>, ["= 1.0.0"])
    s.add_dependency(%q<execjs>, [">= 1.2.9"])
    s.add_dependency(%q<haml_assets>, ["= 0.1.0"])
    s.add_dependency(%q<haml_coffee_assets>, ["= 1.1.2"])
    s.add_dependency(%q<haml-rails>, ["= 0.4"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<mini_magick>, ["= 3.2.1"])
    s.add_dependency(%q<plupload-rails>, ["= 1.0.6"])
    s.add_dependency(%q<rails>, ["~> 3.2.8"])
    s.add_dependency(%q<rmagick>, ["= 2.13.1"])
    s.add_dependency(%q<sass-rails>, ["~> 3.2.3"])
    s.add_dependency(%q<tire>, ["~> 0.4.3"])
    s.add_dependency(%q<will_paginate>, [">= 0"])
    s.add_dependency(%q<better_errors>, [">= 0"])
    s.add_dependency(%q<binding_of_caller>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, ["= 0.8.0"])
    s.add_dependency(%q<debugger>, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>, ["= 3.5.0"])
    s.add_dependency(%q<faker>, ["= 1.0.1"])
    s.add_dependency(%q<nyan-cat-formatter>, [">= 0"])
    s.add_dependency(%q<mysql2>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.12"])
    s.add_dependency(%q<shoulda-matchers>, [">= 0"])
  end
end
