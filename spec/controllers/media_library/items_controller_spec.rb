require 'spec_helper'

module MediaLibrary
  describe ItemsController do

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

    describe "POST 'create'" do
      context "no associated media" do

        before(:each) do
          @profile =  {title: "foo", description: "foofoo"}
        end
        
        it "doesnt create a profile" do
          lambda do
            post :create, profile: @profile,  use_route: "media_library"
          end.should_not change(Profile,:count)
        end
      
        it "returns a flash error" do
          post :create, profile: @profile,  use_route: "media_library"
          flash[:error].should_not be_nil
        end
      end
      
      # it "creates a new profile given valid item instance" do
      #   image = create(:image)
      #   lambda do
      #     post :create, upload_id: image.id, upload_type: "MediaLibrary::Image", profile: {user_id: 1, content_type: "png", title: "foo", description: "foofoo"}, use_route: "media_library"
      #   end.should change(Profile, :count)
      # end
    end

    context "routes requiring ids" do

      before(:each) do
        @image = create(:image)
        @image.build_profile(user_id: 1, title: 'foo', content_type:'image')
        @image.save
        @image_params = @image.profile.to_hash.except("created_at", "id", "profileable_type", "updated_at")
      end

      describe "GET 'edit'" do
        it "returns http success" do
          get :edit, id: @image.profile.id, use_route: "media_library"
        end
      end

      describe "PUT 'update'" do
        it "returns http success" do
          put :update, id: @image.profile.id, profile: @image_params, use_route: "media_library"
        end

        it "redirect to the index on success" do
          put :update, id: @image.profile.id, profile: @image_params, use_route: "media_library"
          response.should redirect_to '/media_library/items'
        end

        it "updates correctly" do
          put :update, id: @image.profile.id, profile: {title: "ryan C"},  use_route: "media_library"
          @image.reload
          @image.profile.title.should eql('ryan C')
        end


        it "redirects back to the edit page on failure" do
          put :update, id: @image.profile.id, profile: @image_params, use_route: "media_library"
          response.should redirect_to '/media_library/items'
        end
      end

      describe "DELETE 'destroy'" do
        it "sets an item to inactive when 'deleted'" do
          delete :update, id: @image.profile.id, profile: {active: false}, use_route: "media_library"
          @image.reload
          @image.profile.active.should eql(false)
        end   
      end
    end
  end
end
