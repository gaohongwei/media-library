require 'spec_helper'

module MediaLibrary
  describe Gallery do
    context "Associations" do
      it { should belong_to(:user) }
      it { should have_many(:gallery_profiles) }
      it { should have_many(:profiles).through(:gallery_profiles) }
    end

    context "validations" do
      it "has a unique title" do
        Gallery.create({title: "Adams rad test"})
        Gallery.create({title: "Adams rad test"}).should_not be_valid
      end
    end
    
    context "gallery_profile associations" do
      before(:each) do
        @item = FactoryGirl.create(:imageWithProfile)
        @gallery = FactoryGirl.create(:gallery)
        @gallery.gallery_profiles.create({profile_id: @item.profile.id})
        @gallery.save
      end

      describe "on create" do
        it "should create a gallery with the associated profile" do
          @gallery.gallery_profiles.first.profile_id.should eql(@item.profile.id)
        end
      end

      describe "on destroy" do
        it "destroys the associated gallery_profile" do
          lambda {
            @gallery.destroy
          }.should change(MediaLibrary::GalleryProfile, :count).by -1 
        end
      end
    end
  end
end
