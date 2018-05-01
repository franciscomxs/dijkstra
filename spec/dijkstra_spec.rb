RSpec.describe Dijkstra do
  it { expect(Dijkstra::VERSION).to eq('0.1.0') }

  describe '#algorithm' do
    let(:array) { [
      ['A', 'B', 7],
      ['A', 'C', 9],
      ['A', 'F', 14],
      ['B', 'C', 10],
      ['B', 'D', 15],
      ['C', 'D', 11],
      ['C', 'F', 2],
      ['D', 'E', 6],
      ['E', 'F', 9]
    ]}

    let(:algorithm) { Dijkstra.algorithm(array, 'A', 'E')}

    describe '#shortest_route' do
      before { algorithm.run }
      it { expect(algorithm.shortest_route).to eq('A - C - F - E') }
    end

    describe '#shortest_distance' do
      before { algorithm.run }
      it { expect(algorithm.shortest_distance).to eq(20) }
    end
  end
end
