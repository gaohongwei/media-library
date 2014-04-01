module MediaLibrary
  class VideoUploader < BaseUploader
    def extension_white_list
      MediaLibrary.configuration.video_types
    end

  end
end
