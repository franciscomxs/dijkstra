require 'spec_helper'

RSpec.describe Dijkstra::Edge do
  context 'valid Edge' do
    it { expect(Dijkstra::Edge.new(:a, :b, 10)).to be_a(Dijkstra::Edge) }
  end

  context 'invalid Edge' do
    it { expect { Dijkstra::Edge.new(:a, :b, 'foo') }.to \
      raise_error(TypeError, 'Distance must be an integer value') }

    it { expect { Dijkstra::Edge.new(nil, :b, 'foo') }.to \
      raise_error(TypeError, "'a' and 'b' are required vertices/keys "\
        "(integer, string or symbol)") }

    it { expect { Dijkstra::Edge.new(:a, nil, 'foo') }.to \
      raise_error(TypeError, "'a' and 'b' are required vertices/keys "\
        "(integer, string or symbol)") }
  end

  describe '#destiny_from' do
    let(:edge) { Dijkstra::Edge.new('Foo', 'Bar', 10) }
    it { expect(edge.destiny_from('Foo')).to eq('Bar') }
  end
end
