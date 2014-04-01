require 'spec_helper'

module MediaLibrary
  describe GalleriesController do

    describe "GET 'index'" do
      it "returns http success" do
        get :index, use_route: "media_library"
      end
    end

    describe "GET 'new'" do
      it "returns http success" do
        get :new, use_route: "media_library"
      end
    end

    describe "GET 'edit'" do
      it "returns http success" do
        gallery = create(:gallery)
        id = gallery.id

        get :edit, id: id, use_route: "media_library"
      end
    end

    describe "GET 'show'" do

      before(:each) do
        @gallery = create(:gallery)
        @images = []
        3.times do
          image = create(:imageWithProfile)
          create(:gallery_profile, gallery_id: @gallery.id, profile_id: image.profile.id)
          @images << image
        end
      end

      it "returns http success" do
        get :show, id: @gallery.id, use_route: "media_library"
      end

      it "assigns items tagged with bucket name" do
        get :show, id: @gallery.id, use_route: "media_library"
        @images.count.should eq 3
      end
    end

    describe "DELETE 'destroy'" do
      before(:each) do
        @gallery = FactoryGirl.create(:gallery)
      end

      it "returns http success" do
        delete :destroy, id: @gallery, use_route: "media_library"
      end

      it "successfully destroys the specified gallery" do
        lambda do
          delete :destroy, id: @gallery, use_route: "media_library"
        end.should change(MediaLibrary::Gallery, :count).by -1
      end
    end

  end
end
