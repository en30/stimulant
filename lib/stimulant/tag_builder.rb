module Stimulant
  class TagBuilder
    def initialize(tag_builder, controller, **data)
      @scope = Scope.new(controller, data: data)
      @tag_builder = tag_builder
    end

    def respond_to_missing?(*args)
      true
    end

    def method_missing(name, *args, data: {}, **kargs, &block) # rubocop:disable Style/MethodMissingSuper
      data = data.merge(@scope.root_data)
      @tag_builder.public_send(name, *args, data: data, **kargs, &block.curry(2)[@scope])
    end
  end
end
