require 'spec_helper'

module MediaLibrary
  describe SearchesController do
    describe "#search" do

      context "no criteria are passed" do
        before :each do
          request.env["HTTP_REFERER"] = profiles_path
        end

        it "returns nothing if nil is passed" do
          get :search, use_route: "media_library", search: nil
          expect(response).to redirect_to profiles_path
        end

        it "returns nothing if empty string is passed" do
          get :search, use_route: "media_library", search: ""
          expect(response).to redirect_to profiles_path
        end
      end

      context "valid criteria are passed" do

        it "returns http success" do
          get :search, use_route: "media_library", search: "et"
        end

        it "assigns tire search results to instance variable results" do
          get :search, use_route: "media_library", search: "et"
          expect(assigns(:results).class).to eq Tire::Results::Collection
        end

        it "renders index" do
          get :search, use_route: "media_library", search: "et"
          expect(response).to render_template("index")
        end

      end
    end
  end
end
