require 'media_library/custom_exceptions'

module MediaLibrary
  class UploadsController < MediaLibrary::BaseController
    respond_to :js       
    rescue_from MediaLibrary::InvalidArgument, :with => :invalid_file
    rescue_from MediaLibrary::FileSizeBounds, :with => :invalid_file
    rescue_from MediaLibrary::MimeTypeMismatch, :with => :invalid_file

    def create
      item = use_uploader params[:file] if (params[:file])
      item = use_url_uploader params[:url] if (params[:url])
  
      item.profile.update_attribute(:user_id, authorized_user.id)
    
      if item.save!
        output = MediaLibrary::UploadsPresenter.new(item)
        render json: { status: 200, item: output.upload }
      else
        render json: {  status: 400, error: item.errors  }
      end  
    end

    private         
    def use_uploader file
      media_type = Uploader.new(file).return_media_type

      if(media_type == "Variation")
        MediaLibrary::Document.create(file: file)
      else
        MediaLibrary.class_eval(media_type).create(file: file, size: file.size)
      end
    end

    def use_url_uploader url
       media_type = UrlUploader.new(url).return_media_type
        
      if media_type == "HostedVideo"
        item = MediaLibrary.class_eval(media_type).create(url: url)
      else
        # instantiated with a temporary size until the item is resaved
        item = MediaLibrary::Linked.set_uploader({remote_file_url: url, size: 1,
                                                url: url, media_type: media_type})
        item.size = item.file.file.size
      end
      item
    end  
    
    def invalid_file(error)
      render json: { error: error.message, status: 400 }
    end
  end
end
