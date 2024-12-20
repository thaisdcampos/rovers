# frozen_string_literal: true

require 'rspec'
require_relative '../rover_navigator'

RSpec.describe RoverNavigator do
  subject(:rover_navigator) { navigator.navigate_rovers }

  let(:file_path) { 'spec/fixtures/input_rovers.txt' }
  let(:navigator) { RoverNavigator.new(file_path) }

  describe '#navigate_rovers' do
    let(:expect_move) { '5 1 E' }

    before do
      allow(Rover).to receive(:navigate).and_return(expect_move)
    end

    it 'navigates rovers based on their routes' do
      expect(rover_navigator).to eq(['5 1 E'])
    end
  end
end
