require 'media_library/base_controller'

module MediaLibrary
  class GalleriesController < MediaLibrary::BaseController
    before_filter :find_by_id, only: [:edit, :update, :destroy]

    def index
      @galleries = Gallery.all
    end

    def new
      @gallery = Gallery.new
    end

    def show
      @gallery = Gallery.find(params[:id])
      @items = @gallery.profiles
    end

    def edit
    end

    def create
      gallery = Gallery.new(params[:gallery])
      
      respond_to do |f|
        if gallery.save 
          f.html { redirect_to galleries_path }
          f.js { render json: { status: 200, model: gallery.to_json }}
        else
          f.html { redirect_to new_gallery_path }
          f.js { render json: { status: 400, error: gallery.errors.full_messages }}
        end
      end
    end

    def update
      @gallery.update_attributes(params[:gallery])
      respond_to do |f|
        if @gallery.save
          f.html { redirect_to galleries_path }
        else
          f.html { redirect_to edit_gallery_path }
        end
      end
    end

    def destroy
      respond_to do |f|
        if @gallery.destroy
          f.html { redirect_to galleries_path }
          f.js { render json: {status: 400, model: @gallery } } 
        else
          f.html { redirect_to galleries_path }
          f.js { render json: {status: 400, error: @gallery.errors } }
        end
      end
    end

    private
    def find_by_id
      @gallery = Gallery.where(id: params[:id]).first
    end
  end
end
