module MediaLibrary
  class Uploader
    attr_accessor :file

    def initialize(file)
      # We need to explicitly check the class name here as kind_of? will try
      # to name-space the class under MediaLibrary

      unless file.present? && file.class.name.include?("UploadedFile")
        raise InvalidArgument, "Not a file."
      end

      @file = file
    end

    class << self
      def return_media_model(params)
        raise ArgumentError, "Must be passed a hash." unless params.present? && params.kind_of?(Hash)
        params[:upload_type].constantize.send(:find, params[:upload_id])
      end
    end

    def return_media_type
      raise FileSizeBounds, "File size invalid." unless valid_file_size?

      content_type = parse_content_type
      model_type(content_type)
    end

    private
    def valid_file_size?
      (300...1000000000).cover?(@file.size)
    end

    def parse_content_type
      upload_file_type = @file.content_type.split('/').last
      system_file_type = `file --mime-type "#{@file.tempfile.path}"`
      system_file_type = system_file_type.split.last.split('/').last
      
      raise MimeTypeMismatch, "Mime-types do not match." unless upload_file_type == system_file_type

      upload_file_type
    end

    def model_type(content_type)
      if MediaLibrary.configuration.image_types.include?(content_type)
        "Image"
      elsif MediaLibrary.configuration.video_types.include?(content_type)
        "Video"
      else
        "Variation"
      end
    end
  end
end
