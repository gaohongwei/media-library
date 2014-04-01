shared_examples_for "uploader_models" do |model, klass, resource_type, resources|
  context "instantiating a model" do
    it "is created with a valid resource" do
      lambda do
        klass.new(resources[:photo])
      end.should_not raise_error
    end
   
    it "is throws an error if the resource is nil or isn't a valid resource" do
      [nil,"String"].each do |test_case|
        lambda do
          klass.send(:new, test_case)
        end.should raise_error(MediaLibrary::InvalidArgument)
      end
    end
  end
  
  context "instantiated model" do
    it "has an accessible resource attribute" do
      model.should respond_to :"#{resource_type}"
    end

    it "has a method #return_media_type" do
      model.should respond_to(:return_media_type)
    end
  end
  
  context "#return_media_type" do
    it "returns 'Image' given an image" do
      model.return_media_type.should eql("Image")
    end

    it "returns 'Video' given a video" do
      uploader = klass.send(:new, resources[:video]) 
      uploader.return_media_type.should eql("Video")
    end
=begin    
    it "returns 'HostedVideo' given a youtube or vimeo uri" do
      uploader = klass.send(:new, resources[:hosted_video]) 
      uploader.return_media_type.should eql("HostedVideo")
    end
=end
    it "returns 'Variation' otherwise" do
      uploader = klass.send(:new, resources[:variation]) 
      uploader.return_media_type.should eql("Variation")
    end
  end
end
