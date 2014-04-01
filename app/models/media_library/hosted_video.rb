require 'uri'

module MediaLibrary
  class HostedVideo < ActiveRecord::Base
    attr_accessible :url, :thumbnail_url, :embed_url
    has_profile
    
    before_create :add_profile
    after_create :youtube_or_vimeo
    after_create :create_embed_url

    private
    def add_profile
      self.build_profile(title: url + '_' + Time.now.nsec.to_s, content_type: "link/video")
    end

    def youtube_or_vimeo
      uri = URI.parse url
      if uri.host.include? "youtu"
        update_attribute(:thumbnail_url, "http://img.youtube.com/vi/#{uri.request_uri.match(/.*(?:\/|v=)([^&$]+)/)[1]}/0.jpg")
      elsif uri.host.include? "vimeo"
        # we should initiate a resque call here, although that adds additional dependecies.
        # since vimeo videos are unlikely at this stage, we'll just serve a placeholder
        update_attribute(:thumbnail_url, "http://placehold.it/360")
      end
    end

    def create_embed_url
      uri = URI.parse url
      if uri.host.include? "youtu"
        update_attribute(:embed_url, "http://www.youtube.com/embed/#{uri.request_uri.match(/.*(?:\/|v=)([^&$]+)/)[1]}/")
      elsif uri.host.include? "vimeo"
        update_attribute(:embed_url, "http://player.vimeo.com/video/#{uri.request_uri.match(/.*(?:\/|v=)([^&$]+)/)[1]}/")
      end 
    end 

  end
end
