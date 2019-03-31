module Stimulant
  class Scope
    def initialize(controller, data: {})
      @controller = Controller.new(controller, data: data)
      @controller_used = false
    end

    def controller
      @controller_used = true
      List.new(@controller)
    end

    def root_data
      Data[[[:controller, controller]] + data.entries]
    end

    def data
      Data[@controller.data.entries]
    end

    def target(name)
      List.new(Target.new(@controller, name))
    end

    def action(name, on: nil, at: nil)
      List.new(Action.new(@controller, name, event: on, source: at))
    end

    def controller_used?
      @controller_used
    end
  end
end
