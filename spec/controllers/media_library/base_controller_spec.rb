require 'spec_helper'

module MediaLibrary
  describe BaseController do
    before(:each) do
      @controller = BaseController.new
    end

    describe "#authorized_user" do
      it "responds to authorized_user" do
        @controller.should respond_to(:authorized_user)
      end

      it "returns the current user object from the host application" do
        auth_user = @controller.authorized_user
        auth_user.should respond_to(:id)
      end
    end
  end
end
