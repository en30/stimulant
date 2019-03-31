module Stimulant
  class Target
    attr_reader :controller, :name
    private :controller
    private :name

    def initialize(controller, name)
      @controller = controller
      @name = name.to_s.underscore.camelize(:lower)
    end

    def to_s
      "#{controller}.#{name}"
    end
  end
end
