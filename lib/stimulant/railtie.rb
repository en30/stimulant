require "rails/railtie"

require "stimulant/helper"

class Stimulant::Railtie < ::Rails::Engine
  initializer "stimulant.helper" do
    ActiveSupport.on_load :action_view do
      include Stimulant::Helper
    end
  end
end
