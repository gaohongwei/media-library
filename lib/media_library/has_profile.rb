module MediaLibrary
  module HasProfile
    extend ActiveSupport::Concern
    
    module ClassMethods
      def has_profile
        has_one :profile, as: :profileable, dependent: :destroy
        delegate :description,:title,:content_type, to: :profile
        accepts_nested_attributes_for :profile 
        attr_accessible :profile_attributes
      end
    end
  end
end

ActiveRecord::Base.send(:include, MediaLibrary::HasProfile)
