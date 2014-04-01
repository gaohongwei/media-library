require 'spec_helper'

module MediaLibrary
  describe Profile do

    context "Associations" do
      it { should belong_to(:user) }
      it { should have_many(:gallery_profiles) }
      it { should have_many(:galleries).through(:gallery_profiles) }
    end

    describe "mass assignment" do
      it { should allow_mass_assignment_of(:content_type) }
      it { should allow_mass_assignment_of(:description) }
      it { should allow_mass_assignment_of(:title) }
      it { should allow_mass_assignment_of(:tag_list) }
      it { should allow_mass_assignment_of(:user_id) }
      it { should allow_mass_assignment_of(:gallery_ids) }
      it { should_not allow_mass_assignment_of(:id) }
    end

    describe "creation" do
      context "validations" do
        before(:each) {
          Profile.any_instance.stub(:profileable_id).and_return(1)
          Profile.any_instance.stub(:profileable_type).and_return("MediaLibrary::Image")
        }

        it { should validate_presence_of :content_type }
        it { should validate_presence_of :title }
        it { should validate_uniqueness_of :title }

        it "is not valid without an associated item" do
          Profile.create.should_not be_valid
        end

        context "contextual validation" do  
          before(:each) do
            Profile.any_instance.stub(:content_type).and_return("image/jpg")
          end

          it "is not valid without a user" do
            Profile.any_instance.stub(:requires_authorization?).and_return(true)
            Profile.create(title: "foo").should_not be_valid
          end

          it "is valid without a user" do
            Profile.any_instance.stub(:requires_authorization?).and_return(false)
            Profile.create!(title: "foo").should be_valid
          end
        end 

      end
    end

    context "methods" do
      context "it responds to" do
        it { should respond_to :media }
        it { should respond_to :default_image }
        it { should respond_to :has_image? }
      end
      
      context "helpers" do
        describe "#has_image?" do
          it "returns true if the profile has an associated image model" do
            profile = create(:imageWithProfile).profile
            profile.has_image?.should be_true
          end

          it "returns false otherwise" do
            profile = create(:videoWithProfile).profile
            profile.has_image?.should_not be_true
          end
        end

        describe "#media" do
          it "returns a reference to the uploaded file" do
            profile = create(:imageWithProfile).profile
            profile.media.should_not  be_nil
          end 
        end
      end
    end
  end
end
