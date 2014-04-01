require 'spec_helper'

module MediaLibrary
  describe Document do
    it { should respond_to(:profile)}
    
    context "associations" do
      pending
      # it { should have_many :variations }
    end

    context "base attribute accessibility" do
      pending
      # it { should allow_mass_assignment_of :name }
      # it { should_not allow_mass_assignment_of :id } 
    end

    # describe "@upload instance variable" do
    #   before (:all) do
    #     @document = create(:documentWithProfile)
    #   end

    #   it "is readable" do
    #     pending
    #     @document.should respond_to(:upload)
    #   end

    #   it "is a file" do
    #     pending
    #     @document.upload.should be_an_instance_of File
    #   end

    #   it "is not writable" do
    #     pending
    #     expect { @document.upload = "hi" }.to raise_error
    #   end
    # end
    
    # describe "#file" do
    #   before (:each) do
    #     @document = create(:documentWithProfile)
    #   end

    #   it "has a method called file" do
    #     pending
    #     @document.should respond_to(:file)
    #   end

    #   it "returns an image" do
    #     pending
    #     @document.file.to_s.should eq(MediaLibrary.configuration.document_fallback)
    #   end

    #   it "also responds to url" do
    #     pending
    #     @document.file.should respond_to(:url)
    #   end

    #   it "returns the image when accessed via url" do
    #     pending
    #     @document.file.url.to_s.should eq(MediaLibrary.configuration.document_fallback)
    #   end

    #   it "formats the file in a json object for consistent client side rendering" do
    #     pending
    #     @document.file.as_json.should eq({:url => MediaLibrary.configuration.document_fallback})
    #   end
    # end

    # context "before_create callback" do
    #   describe "#set_temp_name" do
    #     pending
    #     it "defines a name containing 'Document Collection' and the time" do
    #       document = create(:documentWithProfile)
    #       document.name.should_not be_nil
    #       document.name.should include("Document Collection")
    #     end
    #   end
    # end

    # context "after_commit callbacks" do
    #   describe "#add_profile" do
    #     it "creates a profile after commitng to the database" do
    #       pending
    #       expect {
    #         create(:documentWithProfile)
    #       }.to change(MediaLibrary::Profile, :count).by 1
    #     end
    #   end

    #   describe "#add_variation" do
    #     it "create a variation after commiting to the database" do
    #       pending
    #       expect {
    #         create(:documentWithProfile)
    #       }.to change(MediaLibrary::Variation, :count).by 1
    #     end
    #   end
    # end
  end
end
