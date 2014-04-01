module MediaLibrary
  class Linked < ActiveRecord::Base
    extend CarrierWave::Mount

    attr_accessible :media_type, :url, :file, :remote_file_url, :size, :alt_tag
    validates :media_type, :url, :file, :size, presence: true
    has_profile

    after_initialize :derive_uploader
    before_create :add_profile

    class << self
      def set_uploader hash
        self.mount_uploader(:file, MediaLibrary.class_eval(hash[:media_type]+"Uploader"))
        self.create(hash)
      end
    end
    
    def derive_uploader
      return if self.media_type.nil?
      self.mount(self.media_type + "Uploader")
    end

    def mount(uploader)
      MediaLibrary::Linked.mount_uploader(:file, MediaLibrary.class_eval(uploader))
    end

    private
    def add_profile
      p file
      self.build_profile(title: file.file.filename + '_' + Time.now.nsec.to_s, content_type: file.file.content_type)
    end
  end
end
