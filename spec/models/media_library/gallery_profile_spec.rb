require 'spec_helper'

module MediaLibrary
  describe GalleryProfile do
    context "Associations" do
      it { should belong_to(:gallery) }
      it { should belong_to(:profile) }
    end
  end
end
