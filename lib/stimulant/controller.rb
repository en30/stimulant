module Stimulant
  class Controller
    attr_reader :name, :data

    def initialize(name, data: {})
      @name = name.to_s.underscore.tr("_", "-")
      @data = data.transform_keys {|k| :"#{name}-#{k.to_s.underscore.tr("_", "-")}" }
    end

    def to_s
      name
    end
  end
end
