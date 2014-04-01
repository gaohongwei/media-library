module MediaLibrary
  class GalleryProfile < ActiveRecord::Base
    attr_accessible :gallery_id, :profile_id

    belongs_to :profile
    belongs_to :gallery
  end
end
