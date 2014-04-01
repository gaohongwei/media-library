CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.development?
      config.storage = :file
      config.enable_processing = false if Rails.env.test?
  end
end
