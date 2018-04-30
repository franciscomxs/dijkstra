require 'spec_helper'

RSpec.describe Dijkstra::Path do
  let(:a) { Dijkstra::Path.new('A', 0, 'A', true) }
  let(:b) { Dijkstra::Path.new('B', 10, 'A', true) }
  let(:c) { Dijkstra::Path.new('C', 15, 'B', true) }
  let(:paths) { [a, b, c] }

  describe '.ancestor' do
    it { expect(Dijkstra::Path.ancestor(paths, a)).to be_nil }
    it { expect(Dijkstra::Path.ancestor(paths, b)).to eq(a) }
    it { expect(Dijkstra::Path.ancestor(paths, c)).to eq(b) }
  end

  describe '.routes' do
    it { expect(Dijkstra::Path.route(paths, a)).to eq([a]) }
    it { expect(Dijkstra::Path.route(paths, b)).to eq([b, a]) }
    it { expect(Dijkstra::Path.route(paths, c)).to eq([c, b, a]) }
  end
end
