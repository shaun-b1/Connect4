require_relative '../lib/player.rb'

describe Player do

  describe '#input' do

    subject(:player_input) { described_class.new('Player 1', Token::RED)}

    context 'when inputting a numeric value between 1 and 7' do

      before do
        valid_input = '3'
        allow(player_input).to receive(:gets).and_return(valid_input)
      end

      it 'exits loop and does not throw an error message' do
        error = 'Invalid input. Please enter a number between 1 and 7'
        expect(player_input).not_to receive(:puts).with(error)
      end
    end

    context 'when inputting a numeric value outside 1 and 7, followed by a value between 1 and 7' do

      before do
        invalid_numeric_input = '9'
        valid_input = '7'
        allow(player_input).to receive(:gets).and_return(invalid_numeric_input, valid_input)
      end

      it 'throws an error, then exits the loop' do
        error = 'Invalid input. Please enter a number between 1 and 7'
        expect(player_input).to receive(:puts).with(error).once
        player_input.input
      end
    end

    context 'when inputting a non numeric value, followed by a value between 1 and 7' do

      before do
        invalid_alpha_input = 'A'
        valid_input = '7'
        allow(player_input).to receive(:gets).and_return(invalid_alpha_input, valid_input)
      end

      it 'throws an error, then exits the loop' do
        error = 'Invalid input. Please enter a number between 1 and 7'
        expect(player_input).to receive(:puts).with(error).once
        player_input.input
      end
    end

    context 'when inputting a non numeric value, followed by a value outside 1 and 7, followed by a value between 1 and 7' do

      before do
        invalid_alpha_input = '!'
        invalid_numeric_input = '10'
        valid_input = '7'
        allow(player_input).to receive(:gets).and_return(invalid_alpha_input, invalid_numeric_input, valid_input)
      end

      it 'throws two errors, then exits the loop' do
        error = 'Invalid input. Please enter a number between 1 and 7'
        expect(player_input).to receive(:puts).with(error).twice
        player_input.input
      end
    end
  end
end
