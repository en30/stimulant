module Stimulant
  module Helper
    def stimulus_tag(controller, **data)
      TagBuilder.new(tag, controller, **data)
    end

    def stimulus_scope(controller, **data, &block)
      scope = Scope.new(controller, data: data)
      res = capture(scope, &block)
      raise UnusedScopeError unless scope.controller_used?

      res
    end
  end
end
