class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    FakeGuy.new
  end

  class FakeGuy
    attr_accessor :id, :email
    def initialize
      @id = 2
      @email = "testguy@test.biz"
    end

    def build_profile
      MediaLibrary::Profile.new(user_id: self.id)
    end

  end

end

