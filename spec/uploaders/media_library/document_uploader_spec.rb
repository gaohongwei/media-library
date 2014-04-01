require 'spec_helper'
require 'carrierwave/test/matchers'

module MediaLibrary
  describe DocumentUploader do
    include CarrierWave::Test::Matchers
  end
end
