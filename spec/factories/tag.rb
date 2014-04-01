include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :tag, class: ActsAsTaggableOn::Tag do
    sequence(:name) { |x| "#{x}tag#{rand}" }
  end

  factory :specifiedTag, class: ActsAsTaggableOn::Tag do
    name "foo"
  end
end
