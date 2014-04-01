module MediaLibrary
  class ImageUploader < BaseUploader
    include CarrierWave::RMagick

    def extension_white_list
      MediaLibrary.configuration.image_types
    end

    version :large do
      process :resize_to_limit => [691, 491]
    end

    version :medium do
      process :resize_to_limit => [217, 131]
    end

    version :small do
      process :resize_to_limit => [148, 90]
    end

    version :thumbnail do
      process :resize_to_limit => [64, 39]
    end

  end
end
