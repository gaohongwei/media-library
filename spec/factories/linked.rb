include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :linked, class: MediaLibrary::Linked do
    alt_tag  "I'm in the woods and its cold out"
    file { File.open(Rails.root.join("sample_data/snoez.jpg")) }
    size     "12000kb"
    url      "http://www.url.biz"
    media_type "Image"
  end
end
