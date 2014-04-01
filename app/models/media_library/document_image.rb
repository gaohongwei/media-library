module MediaLibrary
  class DocumentImage
    def url
      MediaLibrary.configuration.document_fallback
    end

    alias_method :to_s, :url

    def as_json
      { url: url }
    end

  end
end
