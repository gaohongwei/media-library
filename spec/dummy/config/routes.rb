Rails.application.routes.draw do

  mount MediaLibrary::Engine => "/media_library"
end
