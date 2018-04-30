module Dijkstra
  class Graph
    attr_accessor :nodes

    def initialize(nodes = [])
      @nodes = nodes
    end

    def [](key)
      nodes[key]
    end

    def each(&block)
      nodes.each(&block)
    end

    def map(&block)
      nodes.map(&block)
    end

    def select(&block)
      nodes.select(&block)
    end

    def find(&block)
      nodes.find(&block)
    end

    def find_edge(a, b)
      find { |edge| Set.new([edge.a, edge.b]) == Set.new([a, b]) }
    end
  end
end
