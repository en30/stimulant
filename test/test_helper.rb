$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "minitest/autorun"
require "rails"
require "rails/test_help"

require "stimulant"

Rails.env = "production"
