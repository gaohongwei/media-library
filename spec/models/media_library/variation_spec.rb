require 'spec_helper'

module MediaLibrary
  describe Variation do
    context "attributes" do
      it { should allow_mass_assignment_of :file }
      it { should allow_mass_assignment_of :size }
      it { should allow_mass_assignment_of :active }
      it { should_not allow_mass_assignment_of :id }
    end

    context "associations" do
      it { should belong_to :document }
    end

    context "uploader" do
      it "has an document uploader" do
        variation = Variation.new
        variation.file.class.should eq MediaLibrary::DocumentUploader
      end

      it "should be able to upload PDFs" do
        variation = MediaLibrary::Variation.new(file: File.open(Rails.root.join("sample_data/recipies.pdf")),size: "100kb")
        variation.file.should_not be_nil
      end
    end

    context "validations" do
      it { should validate_presence_of :document_id }
      it { should validate_presence_of :file }
    end
  end
end
