require 'spec_helper'

module MediaLibrary
  describe Video do

    context "base attribute accessibility" do
      include_context "accessors"
    end

    context "uploader" do
      it "has an video uploader" do
        @video = create(:video)
        @video.file.class.should eq MediaLibrary::VideoUploader
      end
    end

  end
end
