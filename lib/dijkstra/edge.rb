module Dijkstra
  class Edge
    attr_accessor :a, :b, :distance
    def initialize(a, b, distance)
      raise TypeError.new(
        "'a' and 'b' are required vertices/keys (integer, string or symbol)"
      ) unless [a, b].all? do |arg|
        [Integer, String, Symbol].include?(arg.class)
      end

      raise TypeError.new(
        'Distance must be an integer value'
      ) unless distance.is_a?(Integer)

      @a, @b, @distance = a, b, distance
    end

    def include?(vertex)
      [a, b].include?(vertex)
    end

    def destiny_from(origin)
      [a, b].find { |vertex| vertex != origin }
    end
  end
end
