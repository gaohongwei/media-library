MediaLibrary.configure do |config|
  # specifiy method to access logged and authorized user
  config.authorized_user = :current_user

  # Add additional media types here

  # config.image_types = %w(jpg jpeg gif png)
  # config.doc_types = %w(txt pdf doc)
  # config.video_types = %w(mp4 m4v mov mpeg mpg flv avi)

  # Define controller inheritence. Leave nil for ApplicationController
  # config.controller = nil
end
