require 'spec_helper'

RSpec.describe Dijkstra::Algorithm do
  let(:ab) { Dijkstra::Edge.new('A', 'B', 7) }
  let(:ac) { Dijkstra::Edge.new('A', 'C', 9) }
  let(:af) { Dijkstra::Edge.new('A', 'F', 14) }
  let(:bc) { Dijkstra::Edge.new('B', 'C', 10) }
  let(:bd) { Dijkstra::Edge.new('B', 'D', 15) }
  let(:cd) { Dijkstra::Edge.new('C', 'D', 11) }
  let(:cf) { Dijkstra::Edge.new('C', 'F', 2) }
  let(:de) { Dijkstra::Edge.new('D', 'E', 6) }
  let(:ef) { Dijkstra::Edge.new('E', 'F', 9) }
  let(:edges) { [ab, ac, af, bc, bd, cd, cf, de, ef] }
  let(:graph) { Dijkstra::Graph.new(edges) }
  let(:algorithm) { Dijkstra::Algorithm.new(graph, 'A', 'E') }

  describe '#vertices' do
    it { expect(algorithm.vertices).to eq(['A', 'B', 'C', 'D', 'E', 'F']) }
  end

  describe '#paths' do
    it { expect(algorithm.paths[0].vertex).to eq('A') }
    it { expect(algorithm.paths[0].distance).to eq(0) }
    it { expect(algorithm.paths[0].ancestor).to be(nil) }
    it { expect(algorithm.paths[1].vertex).to eq('B') }
    it { expect(algorithm.paths[1].distance).to eq(Float::INFINITY) }
    it { expect(algorithm.paths[1].ancestor).to be(nil) }
    it { expect(algorithm.paths[2].vertex).to eq('C') }
    it { expect(algorithm.paths[2].distance).to eq(Float::INFINITY) }
    it { expect(algorithm.paths[2].ancestor).to be(nil) }
    it { expect(algorithm.paths[3].vertex).to eq('D') }
    it { expect(algorithm.paths[3].distance).to eq(Float::INFINITY) }
    it { expect(algorithm.paths[3].ancestor).to be(nil) }
    it { expect(algorithm.paths[4].vertex).to eq('E') }
    it { expect(algorithm.paths[4].distance).to eq(Float::INFINITY) }
    it { expect(algorithm.paths[4].ancestor).to be(nil) }
    it { expect(algorithm.paths[5].vertex).to eq('F') }
    it { expect(algorithm.paths[5].distance).to eq(Float::INFINITY) }
    it { expect(algorithm.paths[5].ancestor).to be(nil) }
  end

  describe '#neighbors' do
    it { expect(algorithm.neighbors('A')).to eq(['B', 'C', 'F']) }
    it { expect(algorithm.neighbors('B')).to eq(['A', 'C', 'D']) }
    it { expect(algorithm.neighbors('C')).to eq(['A', 'B', 'D', 'F']) }
    it { expect(algorithm.neighbors('D')).to eq(['B', 'C', 'E']) }
    it { expect(algorithm.neighbors('E')).to eq(['D', 'F']) }
    it { expect(algorithm.neighbors('F')).to eq(['A', 'C', 'E']) }
  end

  describe '#shortest_route' do
    before { algorithm.run }
    it { expect(algorithm.shortest_route).to be_a(Array) }
    it { expect(algorithm.shortest_route.size).to eq(4) }
    it { expect(algorithm.shortest_route[0]).to be_a(Dijkstra::Path) }
    it { expect(algorithm.shortest_route[0].vertex).to eq('A') }
    it { expect(algorithm.shortest_route[0].distance).to eq(0) }
    it { expect(algorithm.shortest_route[0].complete).to be_truthy }
    it { expect(algorithm.shortest_route[1]).to be_a(Dijkstra::Path) }
    it { expect(algorithm.shortest_route[1].vertex).to eq('C') }
    it { expect(algorithm.shortest_route[1].distance).to eq(9) }
    it { expect(algorithm.shortest_route[1].complete).to be_truthy }
    it { expect(algorithm.shortest_route[2]).to be_a(Dijkstra::Path) }
    it { expect(algorithm.shortest_route[2].vertex).to eq('F') }
    it { expect(algorithm.shortest_route[2].distance).to eq(2) }
    it { expect(algorithm.shortest_route[2].complete).to be_truthy }
    it { expect(algorithm.shortest_route[3]).to be_a(Dijkstra::Path) }
    it { expect(algorithm.shortest_route[3].vertex).to eq('E') }
    it { expect(algorithm.shortest_route[3].distance).to eq(9) }
    it { expect(algorithm.shortest_route[3].complete).to be_truthy }
  end

  describe '#shortest_path' do
    before { algorithm.run }
    it { expect(algorithm.shortest_path).to eq('A - C - F - E') }
  end

  describe '#shortest_distance' do
    before { algorithm.run }
    it { expect(algorithm.shortest_distance).to eq(20) }
  end
end
