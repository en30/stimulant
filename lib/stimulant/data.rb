module Stimulant
  class Data < Hash
    def +(other)
      merge(other) do |_key, oldval, newval|
        oldval + newval
      end
    end
  end
end
