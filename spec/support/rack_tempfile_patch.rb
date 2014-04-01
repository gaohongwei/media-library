# Little monkey patch to expose the @tempfile parameter, necessary
# to check mime-type at the filesystem level
#      ".           ,#  
#      \ `-._____,-'=/
#       `._ ----- _,'
#          `-----'
module Rack
  module Test
    class UploadedFile
      def tempfile
        @tempfile
      end
    end
  end
end

