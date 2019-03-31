require "stimulant/version"

module Stimulant
  class UnusedScopeError < StandardError; end
  # Your code goes here...
end

require "stimulant/data"
require "stimulant/scope"
require "stimulant/helper"
require "stimulant/list"
require "stimulant/controller"
require "stimulant/action"
require "stimulant/target"

require "stimulant/railtie" if defined?(Rails)
