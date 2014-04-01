require "haml"
require "sass"
require "acts-as-taggable-on"
require 'carrierwave'
require "RMagick"
require "mini_magick"
require "plupload/rails"
require "tire"
require "media_library/engine"
require "media_library/configuration"
require 'media_library/custom_exceptions'
require 'will_paginate'
require 'will_paginate/array'

if Rails.env.test?
  require "debugger"
  require "capybara"
  require "rspec-rails"
end

if Rails.env.development?
  require "debugger"
  require 'better_errors'
  require 'binding_of_caller'
end

module MediaLibrary
end
