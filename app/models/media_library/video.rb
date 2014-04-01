module MediaLibrary
  class Video < ActiveRecord::Base
    attr_accessible :file, :size

    has_profile

    mount_uploader :file, MediaLibrary::VideoUploader
  end
end
