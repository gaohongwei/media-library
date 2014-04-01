include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :profile, class: MediaLibrary::Profile do
    title "Wilderness"
    description "Its really snowy out you guys"
    content_type "image/png"
    user_id 1
  end
end
