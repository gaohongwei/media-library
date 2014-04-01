require 'faker'
include MediaLibrary::HasProfile
#
# Image creation
filepath = Rails.root.join("sample_data/snoez.jpg")
image = File.open(filepath)

image_data = {
  file: image,
  size: image.size.to_s,
  alt_tag: Faker::Lorem.words(3).join(' ')
}

profile_data = {
  profile_attributes: {
    user_id: 1,
    content_type: "image/jpg",
    description: Faker::Lorem.sentences(2).join(' ')
  }
}


count = 0

while(count < 20) do
  profile_data[:profile_attributes][:title] = Faker::Lorem.words(3).join(' ')

  if MediaLibrary::Profile.where(title: profile_data[:profile_attributes][:title]).first
    count += 1
  else
    i = MediaLibrary::Image.create(image_data)
    i.update_attributes(profile_data)
    i.save!
    count += 1
  end
end


galleries = ["Snowboading","Spear Fishing", "Bungee Fencing",
           "Extreme Arsonry", "BMXxxing","Cock Fighting","Uphill Skiing"]

galleries.each do |name|
  MediaLibrary::Gallery.find_or_create_by_title(title: name)
end
