require 'spec_helper'
require 'carrierwave/test/matchers'

module MediaLibrary
  describe VideoUploader do
    include CarrierWave::Test::Matchers
  end
end
