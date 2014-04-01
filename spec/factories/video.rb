include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :video, class: MediaLibrary::Video do
    file     File.open(File.join(Rails.root, "sample_data", "vid.mp4"))
    size     "12000kb"
  end
  
  factory :videoWithProfile, class: MediaLibrary::Video do
    file     File.open(File.join(Rails.root, "sample_data", "vid.mp4"))
    size     "12000kb"

    after(:create) do |instance|
      profile = create(:profile, user_id: 1, title: Faker::Lorem.words(1), description: Faker::Lorem.words(8), profileable_id: instance.id, profileable_type: instance.class.name )
    end
  end
end
