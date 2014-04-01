require 'spec_helper'

module MediaLibrary
  describe Image do

    context "base attribute accessibility" do
      include_context "accessors"
    end

    context "accessability" do
      it { should allow_mass_assignment_of(:alt_tag) }
    end

    context "validations" do
      it { should validate_presence_of :file }
      it { should validate_presence_of :size }
    end

    context "uploadables shared tests" do
      include_context 'uploadables'
    end

    context "uploader" do
      it "has an image uploader" do
        @image = create(:image)
        @image.file.class.should eq MediaLibrary::ImageUploader
      end
    end

  end
end
