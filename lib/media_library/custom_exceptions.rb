module MediaLibrary
  class InvalidArgument < ArgumentError; end
  class MimeTypeMismatch < StandardError; end
  class FileSizeBounds < StandardError; end
end
