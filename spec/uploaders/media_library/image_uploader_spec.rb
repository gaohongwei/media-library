require 'spec_helper'
require 'carrierwave/test/matchers'

module MediaLibrary
  describe ImageUploader do
    include CarrierWave::Test::Matchers

    before do
      ImageUploader.enable_processing = true
      image = create(:image_with_square_attachment)
      @uploader = image.file
    end

    after do
      ImageUploader.enable_processing = false
    end

    context "large version" do
      it "should scale photo down to 691px width" do
        @uploader.large.should be_no_larger_than(691, 491)
      end
    end

    context "medium version" do
      it "should scale photo down to 217px width" do
        @uploader.medium.should be_no_larger_than(217, 131)
      end
    end

    context "small version" do
      it "should scale photo down to 148px width" do
        @uploader.small.should be_no_larger_than(148, 90)
      end
    end

    context "thumbnail version" do
      it "should scale photo down to 64px width" do
        @uploader.thumbnail.should be_no_larger_than(64, 39)
      end
    end

  end
end
