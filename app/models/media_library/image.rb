module MediaLibrary
  class Image < ActiveRecord::Base
    attr_accessible :alt_tag, :file, :size, :remote_file_url

    validates :file, :size, presence: true

    has_profile

    mount_uploader :file, MediaLibrary::ImageUploader

    before_create :add_profile

    private
    def add_profile
      self.build_profile(title: file.file.filename + '_' + Time.now.nsec.to_s, content_type: file.file.content_type)
    end
  end
end
