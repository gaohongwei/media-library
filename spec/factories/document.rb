include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :documentWithProfile, class: MediaLibrary::Document do
    file     { File.open(File.join(Rails.root, "sample_data", "recipies.pdf")) }

    after(:create) do |document|
      profile = create(:profile, user_id: 1, title: Faker::Lorem.words(1),
        description: Faker::Lorem.words(8), profileable_id: document.id,
        profileable_type: document.class.name, content_type: "application/pdf" )
      variation = create(:variation, file: document.upload, size: "1kb")
    end
  end


end
