module MediaLibrary
  class BaseController < MediaLibrary.configuration.controller || ::ApplicationController

    #layout 'media_library/application'

    def authorized_user
      send(MediaLibrary.configuration.authorized_user)
    end

  end
end
