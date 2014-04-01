module MediaLibrary
  class Document < ActiveRecord::Base
    attr_reader :upload
    attr_accessible :name, :file

    has_profile
    has_many :variations, dependent: :destroy

    # callbacks 
    before_create :set_temp_name
    before_create :add_profile
    after_commit :add_variation

    def file=uploaded_file
      @upload = uploaded_file
    end

    def file
      DocumentImage.new
    end

    def as_json(options = {})
      super(options).merge(file: file.as_json)
    end

    private
    # here we are dealing with the raw file, since carrierwave wont be invoked until we save the variation.
    def add_profile
      self.create_profile(title: @upload.original_filename + '_' + Time.now.nsec.to_s, content_type: @upload.content_type)
    end

    def set_temp_name
      self.name = "Document Collection" + '_' + Time.now.nsec.to_s
    end

    def add_variation
      self.variations.build(file: @upload, size: @upload.size)
    end
  end
end
