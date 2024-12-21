# frozen_string_literal: true

require 'rspec'
require_relative '../rover'

RSpec.describe Rover do
  subject(:rover) { described_class.navigate(position: position, route: route, size: size) }

  let(:position) do
    {
      x: 1,
      y: 2,
      cardinal_point: 'N'
    }
  end
  let(:route) { %w[L M L M L M L M M] }
  let(:size) { { x: 5, y: 5 } }

  context 'when initial position is invalid' do
    let(:position) do
      {
        x: -1,
        y: 2,
        cardinal_point: 'N'
      }
    end

    it { expect(rover).to be_nil }
  end

  context 'when rovers move to bound of matrix' do
    let(:route) { %w[M M M] }
    let(:position) { { x: 0, y: 0, cardinal_point: 'S' } }

    it { expect{ rover }.to raise_error('Invalid move: out of bounds!') }
  end

  context 'when destination is valid' do
    it { expect(rover).to eq('1 3 N') }
  end
end
