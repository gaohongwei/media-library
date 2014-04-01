require "spec_helper"

describe MediaLibrary::Configuration do

  subject { MediaLibrary::Configuration.new }

  let(:configure) do
    MediaLibrary.configure do |config|
      config.authorized_user = :current_user
    end
  end

  describe "mass assigns" do
    it { should respond_to(:authorized_user, :image_types, :doc_types, :video_types, 
                          :controller, :image_fallback, :video_fallback, 
                          :document_fallback, :video_hosts) }
  end

  context "when defining attrs" do

    it "has a attr of authorized_user" do
      subject.should respond_to :authorized_user
    end

  end

  context "when getting the attrs" do

    it "assigns authorized_user to a configurable method call that retrieves the current logged in user" do
      MediaLibrary.configuration.authorized_user.should eq :current_user
    end

  end

  context "when setting up the base class" do
    it "has an attribute of configuration" do
      MediaLibrary.should respond_to :configuration
    end

    it "has a method for configure" do
      MediaLibrary.should respond_to :configure
    end

  end

end
