module MediaLibrary
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  class Configuration
    attr_accessor :authorized_user, :image_types, :doc_types, :video_types, :controller,
                  :image_fallback, :video_fallback, :document_fallback, :video_hosts

    def initialize
      @authorized_user = nil
      @image_types = %w(jpg jpeg gif png)
      @doc_types = %w(txt pdf doc)
      @video_types = %w(mp4 m4v mov mpeg mpg flv avi)
      @image_fallback = "/assets/system/default.png"
      @video_fallback = "default.png"
      @video_hosts = %w(youtu.be www.youtube.com youtube.com vimeo.com www.vimeo.com)
      @document_fallback = "doc-placeholder-med.jpg"
      @controller = nil
    end
  end
end
