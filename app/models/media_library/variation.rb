module MediaLibrary
  class Variation < ActiveRecord::Base
    attr_accessible :file, :remote_file_url, :size, :active

    belongs_to :document

    mount_uploader :file, MediaLibrary::DocumentUploader

    validates_presence_of :document_id, :file
    
    default_scope Proc.new { where(active: true) }
  end
end
