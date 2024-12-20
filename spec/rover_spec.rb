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

  before { rover }

  context 'when initial position are invalid' do
    let(:position) do
      {
        x: -1,
        y: 2,
        cardinal_point: 'N'
      }
    end

    it { expect(rover).to be_nil }
  end

  context 'when destination are valid' do
    it { expect(rover).to eq('1 3 N') }
  end
end
