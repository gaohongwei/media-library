require 'spec_helper'

module MediaLibrary
  describe HostedVideo do
    context "accessability" do
      it { should allow_mass_assignment_of(:url) }
      it { should allow_mass_assignment_of(:thumbnail_url) }
    end
    
    describe "#youtube_or_vimeo" do
      it "populates the thumbnail_url attribute when given a youtube link" do
        MediaLibrary::HostedVideo.create(url: "http://www.youtube.com/watch&1232jfsd").thumbnail_url.should_not be_nil
      end
      
      it "populates the thumbnail_url attribute given a vimeo link" do
        MediaLibrary::HostedVideo.create(url: "http://www.vimeo.com/watch&1232jfsd").thumbnail_url.should_not be_nil
      end

      it "does not set thumbnail_url if the link isn't one of the aforementioned services" do
        MediaLibrary::HostedVideo.create(url: "http://www.google.com").thumbnail_url.should be_nil
      end
    end

    describe "#embed_url" do
      it "returns a youtube embed link given a youtube url" do
        vid = MediaLibrary::HostedVideo.create(url: "http://www.youtube.com/watch&34rty4=45")

        vid.embed_url.should include("embed")
      end
    end
  end
end
