module MediaLibrary
  class Gallery < ActiveRecord::Base
    attr_accessible :description, :title, :user_id
    # delegate :username, to: :user, prefix: true
    belongs_to :user
    has_many :gallery_profiles, dependent: :destroy
    has_many :profiles, through: :gallery_profiles

    validates :title, format: { with: /^[[A-Za-z0-9]]+(-[[A-Za-z0-9]]+)*$/,
               message: "Only letters and numbers allowed, with single dashes in between" },
               uniqueness: true

    def active_profiles
      profiles.where(active: true)
    end
  end
end
