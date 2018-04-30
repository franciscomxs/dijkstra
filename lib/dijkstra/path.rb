module Dijkstra
  class Path
    attr_accessor :vertex, :distance, :ancestor, :complete

    def initialize(v, d, a, c = false)
      @vertex, @distance, @ancestor, @complete = v, d, a, c
    end

    def self.startpoint(paths)
      paths.reject { |path| path.complete }.min_by(&:distance)
    end

    def self.find_by_vertex(paths, vertex)
      paths.find { |path| path.vertex == vertex }
    end

    def self.route(paths, current_path)
      previous = ancestor(paths, current_path)
      route = [current_path, previous]

      while !previous.nil? do
        previous = ancestor(paths, previous)
        route << previous
      end

      route.compact
    end

    def self.ancestors(paths, current_path)
      route(paths, current_path).tap { |arr| arr.delete(current_path) }
    end

    def self.ancestor(paths, current_path)
      return nil if current_path.nil? || current_path.vertex == current_path.ancestor
      paths.find { |path| path.vertex == current_path.ancestor }
    end

    def complete!
      @complete = true
    end
  end
end
