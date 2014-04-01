require 'uri'                             

module MediaLibrary
  class UrlUploader
    attr_accessor :url

    def initialize(url)
      unless url.present? && is_url?(url)
        raise InvalidArgument, "URL must in the form of http(s)://example.com"
      end
      @url = url
    end

    def return_media_type
      model_type
    end

    private
    def is_url?(url)
      # catch the exception to pass our own
      begin
        URI.parse(url).kind_of?(URI::HTTP || URI::HTTPS)      
      rescue URI::InvalidURIError
      end
    end

    def model_type
      if MediaLibrary.configuration.video_hosts.include?(URI.parse(@url).host)
        return "HostedVideo"
      end

      content_type = @url.split('/').last.split('.').last
      if MediaLibrary.configuration.image_types.include?(content_type)
        "Image"
      elsif MediaLibrary.configuration.video_types.include?(content_type)
        "Video"
      elsif MediaLibrary.configuration.doc_types.include?(content_type)
        "Variation"
      else
        raise MediaLibrary::InvalidArgument, "File type not recognized. URL should point to a valid photo or a youtube video."
      end
    end
  end
end
