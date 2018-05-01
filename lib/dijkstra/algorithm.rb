module Dijkstra
  class Algorithm
    attr_accessor :graph, :origin, :destination

    def initialize(graph, origin, destination)
      @graph, @origin, @destination = graph, origin, destination
    end

    def run
      current_path = Path.startpoint(paths)
      return if current_path.nil?
      neighbors(current_path.vertex).each do |vertex|
        edge = graph.find_edge(current_path.vertex, vertex)
        path = Path.find_by_vertex(paths, vertex)
        ancestor = Path.ancestor(paths, path)
        next if path.complete

        routed_distance = (edge.distance + Path.ancestors(paths, path).sum(&:distance))

        if routed_distance < path.distance
          path.distance = routed_distance
          path.ancestor = edge.destiny_from(vertex)
        end
      end
      current_path.complete!
      run
    end

    def shortest_path
      Path.route(paths, destination_path).reverse
    end

    def shortest_route
      shortest_path.map(&:vertex).join(' - ')
    end

    def shortest_distance
      shortest_path.sum(&:distance)
    end

    def vertices_for(edges)
      edges.map do |edge|
        [edge.a, edge.b]
      end.flatten.uniq.sort do |a, b|
        a <=> b
      end
    end

    def vertices
      @vertices ||= vertices_for(graph)
    end

    def paths
      @paths ||= vertices.map do |vertex|
        distance = (vertex == origin) ? 0 : Float::INFINITY
        Path.new(vertex, distance, nil)
      end
    end

    def neighbors(vertex)
      vertices_for(graph.select do |edge|
        edge.include?(vertex)
      end).tap { |arr| arr.delete(vertex) }
    end

    def destination_path
      Path.find_by_vertex(paths, destination)
    end

    def origin_path
      Path.find_by_vertex(paths, origin)
    end
  end
end
