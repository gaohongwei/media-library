module MediaLibrary
  class Profile < ActiveRecord::Base
    include Tire::Model::Search

    #include Tire::Model::Callbacks, commented out to pass specs
    #updates index manually
    after_commit do
     update_index
    end

    after_rollback do
     update_index
    end

    mapping do
      indexes :id,           :index    => :not_analyzed
      indexes :title,        :analyzer => 'snowball', :boost => 100
      indexes :description,  :analyzer => 'snowball'
      indexes :tag_list,     :analyzer => 'snowball'
    end

    # delegate :username, to: :user, prefix: true

    belongs_to :profileable, polymorphic: true
    belongs_to :user

    has_many :gallery_profiles, dependent: :destroy
    has_many :galleries, through: :gallery_profiles

    attr_accessor :alt_tag, :url

    attr_accessible :content_type, :description, :title, :tag_list,
                    :active, :profileable_id, :user_id, :gallery_ids,
                    :alt_tag, :url

    validates :profileable_id, :profileable_type, :content_type, presence: true
    validates :title, presence: true, uniqueness: true

    with_options if: :requires_authorization? do |profile|
      profile.validates_presence_of :user_id
    end

    acts_as_taggable

    default_scope Proc.new { includes(:profileable) }

    scope :active, where(active: true)

    def to_indexed_json
      {
        :id      => id,
        :title   => title,
        :description => description,
        :tag_list  => tag_list.to_s
      }.to_json
    end

    def media
      if profileable.respond_to?(:file) 
        profileable.file
      elsif profileable.respond_to?(:thumbnail_url)
        profileable.thumbnail_url 
      else
        false
      end

      #profileable.respond_to?(:file) ? profileable.file : {file: { url: profileable.thumbnail_url } }
    end
    
    # check if model is MediaLibrary::Image or MediaLinrary::Linked
    def is_image?
      content_type.split('/')[0] == "image"
    end

    def has_image?
      self.media && media.respond_to?(:medium)
    end

    def edit_image
      self.media.respond_to?(:large) ? self.media.large : self.default_image
    end

    def default_image
      if %w(application/pdf text/plain application/msword).include? content_type
        MediaLibrary.configuration.document_fallback
      else
        MediaLibrary.configuration.image_fallback
      end
    end

    def requires_authorization?
      !MediaLibrary.configuration.authorized_user.nil?
    end
  end
end
