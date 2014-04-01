require "spec_helper"

module MediaLibrary
  describe Uploader do
    context "class methods" do
      it "::return_media_model" do
        Uploader.should respond_to(:return_media_model)
      end

      describe "::return_media_model" do
        it "raise an error if it doesn't receive a params hash" do
          lambda do
            Uploader.return_media_model(params = nil)
          end.should raise_error(InvalidArgument)
        end

        it "returns a media object given an id and type" do
          image = create(:image) 
          hash = { upload_type: "MediaLibrary::Image", upload_id: image.id }
          media = Uploader.return_media_model(hash)
          media.should eql(image)
        end
      end
    end

    context "shared examples" do
      file = Rack::Test::UploadedFile.new(File.join(Rails.root,"sample_data","snoez.jpg"),"image/jpeg")
      resources = {
        photo: file,
        video: Rack::Test::UploadedFile.new(File.join(Rails.root,"sample_data","vid.mp4"),"video/mp4"),
        variation: Rack::Test::UploadedFile.new(File.join(Rails.root,"sample_data","recipies.pdf"),"application/pdf"),
        hosted_video: "http://www.youtube.com/watch?v=k5XVEUdNye0"
      }
      
      it_should_behave_like "uploader_models", Uploader.new(file),MediaLibrary::Uploader, :file, resources

        
      it "throws an error if the file is too small" do
        file = Rack::Test::UploadedFile.new(File.join(Rails.root,"sample_data","thing.txt"),"text/plain")
        uploader = Uploader.new(file) 
        lambda do
          uploader.return_media_type
        end.should raise_error(FileSizeBounds)
      end

      it "throws an error if the mime-types dont match" do
        file = Rack::Test::UploadedFile.new(File.join(Rails.root,"sample_data","snoez.jpg"),"image/jpg")
        uploader = Uploader.new(file) 
        lambda do
          uploader.return_media_type
        end.should raise_error(MimeTypeMismatch)
      end
    end
  end
end


