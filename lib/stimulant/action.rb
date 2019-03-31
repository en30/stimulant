module Stimulant
  class Action
    attr_reader :controller, :name, :event, :source
    private :controller
    private :name
    private :event
    private :source

    def initialize(controller, name, event: nil, source: nil)
      @controller = controller
      @event = event
      @source = source
      @name = name.to_s.underscore.camelize(:lower)
    end

    def to_s
      s = "#{controller}##{name}"
      s = "#{trigger}->#{s}" unless trigger.nil?
      s
    end

    private

      def trigger
        return nil if event.nil?

        res = event.to_s
        res += "@#{source}" unless source.nil?
        res
      end
  end
end
