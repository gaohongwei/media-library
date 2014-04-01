module MediaLibrary
  class BaseUploader < CarrierWave::Uploader::Base

    def store_dir
      "#{model.class.to_s.underscore}/#{model.id}"
    end
  end
end
