require "spec_helper"

module MediaLibrary
  describe UrlUploader do
    context 'instantiated model' do
      url = "http://localhost:3000/media_library/image/121/medium_kitten-on-white1.jpg"
      resources = {
        photo: url,
        video: "http://invertedbirdfilms.com/a/buongiorno_notte.avi",
        variation: "http://www.guitarpress.com/images/Aguado_AirEspagnolVariations.pdf",
        hosted_video: "http://www.youtube.com/watch?v=k5XVEUdNye0"
      }

      it_should_behave_like "uploader_models", UrlUploader.new(url), MediaLibrary::UrlUploader, :url, resources
    end
  end
end
