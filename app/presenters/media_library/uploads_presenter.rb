module MediaLibrary
  class UploadsPresenter
    attr_accessor :upload

    def initialize item
      @item = item
      @upload = as_hash
    end

    def as_hash
      hash = {}
      hash[:profile] = @item.profile
      hash[:profile][:gallery_ids] = @item.profile.galleries
      hash[:profile][:tag_list] = @item.profile.tag_list 
      hash[:profile][:variations] = @item.variations if @item.class == MediaLibrary::Document
      hash[:item] = @item.as_json
      hash
    end
  end
end

