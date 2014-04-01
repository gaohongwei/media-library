require 'spec_helper'

module MediaLibrary
  describe Linked do
    it_should_behave_like "accessors"
    it { should allow_mass_assignment_of(:alt_tag) }    
    it { should allow_mass_assignment_of(:media_type) }
    it { should allow_mass_assignment_of(:url) }
    
    context "validations" do
      it { should validate_presence_of :file }
      it { should validate_presence_of :size }
      it { should validate_presence_of :url }
      it { should validate_presence_of :media_type }
    end

    context "media uploaded" do
      linked_instance = FactoryGirl.create(:linked)
      it_should_behave_like "uploadables", linked_instance
    end

    context "uploader" do
      it "has carrierwave mounting methods available" do
        MediaLibrary::Linked.should respond_to :mount_uploader
      end

      it "has a dynamically assigned uploader based on media_type" do
        klass = MediaLibrary::Linked
        klass.set_uploader({media_type: "Image"})
        klass.uploaders[:file].should eql(class_eval("MediaLibrary::ImageUploader"))
        klass.set_uploader({media_type: "Document"})
        klass.uploaders[:file].should eql(class_eval("MediaLibrary::DocumentUploader"))
      end
    end
  end
end
