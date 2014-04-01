include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :variation, :class => MediaLibrary::Variation do
    file          { File.open(File.join(Rails.root, "sample_data", "recipies.pdf")) }
    size          "1kb"
    document_id   1
  end
end