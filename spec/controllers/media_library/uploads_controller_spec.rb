require 'spec_helper'

module MediaLibrary
  describe UploadsController do
  
   context "POST 'create'" do
     describe "upload from file" do
        before(:all) do
          @f =  Rack::Test::UploadedFile.new(File.join(Rails.root, "sample_data", "natural_animal_magic.jpeg"), 'image/jpeg')
          @pony =  Rack::Test::UploadedFile.new(File.join(Rails.root, "sample_data", "pony.png"), 'image/png')
          @pdf = Rack::Test::UploadedFile.new(File.join(Rails.root, "sample_data", "recipies.pdf"), 'application/pdf')
        end

        it "returns http success" do
          post :create, file: @f, format: 'js', use_route: :media_library
          response.should be_success
        end

        describe "returns the proper media model based on file type" do
          it "return image/jpeg on jpeg upload" do
            post :create, file: @f, format: 'js', use_route: :media_library
            body = JSON.parse(response.body)
            body["item"]["profile"]["content_type"].should eq("image/jpeg")
          end

          it "returns application/pdf on pdf upload" do
            post :create, file: Rack::Test::UploadedFile.new(File.join(Rails.root, "sample_data", "recipies.pdf"), 'application/pdf'), format: 'js', use_route: :media_library
            body = JSON.parse(response.body)
            body["item"]["profile"]["content_type"].should eq("application/pdf")
          end
        end

        context "when given an image" do
          describe "when given a jpeg" do  
            it "returns an image profileable type" do
              post :create, file: @f, format: 'js', use_route: :media_library
              body = JSON.parse(response.body)
              body["item"]["profile"]["profileable_type"].should eq("MediaLibrary::Image")
            end
          end

          describe "when given a png" do  
            it "returns an image profileable type" do
              post :create, file: @pony, format: 'js', use_route: :media_library
              body = JSON.parse(response.body)
              body["item"]["profile"]["profileable_type"].should eq("MediaLibrary::Image")
            end
          end
        end
      end
    end
  end
end
