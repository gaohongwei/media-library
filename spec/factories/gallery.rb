include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :gallery, class: MediaLibrary::Gallery do
    title  "Moose's Previous Lovers"
    user_id 1
  end
end
