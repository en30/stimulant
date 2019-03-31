module Stimulant
  class List
    attr_reader :items
    protected :items

    def initialize(*items)
      @items = items
    end

    def +(other)
      List.new(*(@items + other.items))
    end

    def to_s
      items.join(" ")
    end

    def to_json(_opts = nil)
      items.map(&:to_s).join(" ")
    end
  end
end
