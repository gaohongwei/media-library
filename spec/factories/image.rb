include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image, class: MediaLibrary::Image do
    alt_tag  "I'm in the woods and its cold out"
    file     File.open(File.join(Rails.root, "sample_data", "snoez.jpg"))
    size     "12000kb"
  end

  factory :image_with_square_attachment, class: MediaLibrary::Image do
    alt_tag  "I'm in the woods and its cold out"
    file     File.open(File.join(Rails.root, "sample_data", "square.png"))
    size     "12000kb"
  end

  factory :image_with_no_image, class: MediaLibrary::Image do
    alt_tag  "I'm in the woods and its cold out"
    size     "12000kb"
  end

  factory :imageWithProfile, class: MediaLibrary::Image do
    alt_tag  "I'm in the woods and its cold out"
    file     File.open(File.join(Rails.root, "sample_data", "snoez.jpg"))
    size     "12000kb"

    after(:create) do |instance|
      profile = create(:profile, user_id: 1, title: Faker::Lorem.words(1), description: Faker::Lorem.words(8), profileable_id: instance.id, profileable_type: instance.class.name )
    end
  end
end
