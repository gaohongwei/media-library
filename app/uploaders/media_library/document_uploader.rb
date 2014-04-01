module MediaLibrary
  class DocumentUploader < BaseUploader
    def extension_white_list
      MediaLibrary.configuration.doc_types
    end
  end
end
