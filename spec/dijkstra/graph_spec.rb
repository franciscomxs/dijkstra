require 'spec_helper'

RSpec.describe Dijkstra::Graph do
  let(:ab) { Dijkstra::Edge.new('A', 'B', 7) }
  let(:ac) { Dijkstra::Edge.new('A', 'C', 9) }
  let(:bc) { Dijkstra::Edge.new('B', 'C', 10) }
  let(:edges) { [ab, ac, bc] }
  let(:graph) { Dijkstra::Graph.new(edges) }

  describe '#[]' do
    it { expect(graph[0]).to eq(ab) }
    it { expect(graph[1]).to eq(ac) }
    it { expect(graph[2]).to eq(bc) }
  end

  describe '#each' do
    it { expect(graph.each).to be_a(Enumerator) }
  end
end
