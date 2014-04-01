require 'media_library/base_controller'

module MediaLibrary
  class SearchesController < MediaLibrary::BaseController

    def search
      unless params[:search].blank?
        @results = MediaLibrary::Profile.search("#{params[:search]}", :load => true, page: params[:page], per_page: 5)
        render "index"
      else
        redirect_to :back
      end
    end

  end
end

