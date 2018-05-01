require 'dijkstra/version'
require 'dijkstra/edge'
require 'dijkstra/graph'
require 'dijkstra/path'
require 'dijkstra/algorithm'

begin
  require 'pry'
rescue LoadError
end

module Dijkstra
  def self.algorithm(array, origin, destination)
    edges = array.map { |edge| Dijkstra::Edge.new(*edge) }
    Dijkstra::Algorithm.new(Dijkstra::Graph.new(edges), origin, destination).tap(&:run)
  end
end
