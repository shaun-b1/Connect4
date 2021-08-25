require_relative '../lib/board.rb'

describe Board do

  subject(:board) { described_class.new }

  describe '#initialize' do

    it 'creates an array of 6 arrays, each containing 7 placeholders' do
      empty_array = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
      ]
      empty_board = board.game_board
      expect(empty_board).to eq(empty_array)
    end
  end

  describe '#valid_move?' do

    before do
      valid_board = [
        ['2', '', '', '', '', '', ''],
        ['1', '1', '', '', '', '', ''],
        ['2', '2', '1', '', '', '', ''],
        ['1', '1', '2', '2', '', '', ''],
        ['2', '2', '1', '1', '2', '', ''],
        ['1', '1', '2', '2', '1', '1', ''],
      ]
      board.instance_variable_set(:@game_board, valid_board)
    end

    context 'if the column is completely empty' do

      it 'returns true' do
        empty_column = 6
        empty_column_input = board.valid_move?(empty_column)
        expect(empty_column_input).to be true
      end
    end

    context 'if the column has an available spot to play' do

      it 'returns true' do
        empty_column = 1
        empty_column_input = board.valid_move?(empty_column)
        expect(empty_column_input).to be true
      end
    end

    context 'if the column doesn\'t have an available spot to play' do

      it 'returns false' do
        empty_column = 0
        empty_column_input = board.valid_move?(empty_column)
        expect(empty_column_input).to be false
      end
    end
  end

  describe '#full?' do

    context 'if board is empty' do

      before do
        empty_board = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
        ]
        board.instance_variable_set(:@game_board, empty_board)
      end

      it 'returns false' do
        check_empty_board = board.full?
        expect(check_empty_board).to be false
      end
    end

    context 'if board is half full' do

      before do
        half_full_board = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['1', '1', '2', '2', '1', '1', '2'],
          ['2', '2', '1', '1', '2', '2', '1'],
          ['1', '1', '2', '2', '1', '1', '2'],
        ]
        board.instance_variable_set(:@game_board, half_full_board)
      end

      it 'returns false' do
        check_half_full_board = board.full?
        expect(check_half_full_board).to be false
      end
    end

    context 'if board is full' do

      before do
        full_board = [
          ['2', '2', '1', '1', '2', '2', '1'],
          ['1', '1', '2', '2', '1', '1', '2'],
          ['2', '2', '1', '1', '2', '2', '1'],
          ['1', '1', '2', '2', '1', '1', '2'],
          ['2', '2', '1', '1', '2', '2', '1'],
          ['1', '1', '2', '2', '1', '1', '2'],
        ]
        board.instance_variable_set(:@game_board, full_board)
      end

      it 'returns true' do
        check_full_board = board.full?
        expect(check_full_board).to be true
      end
    end
  end

  describe '#win_row' do

    context 'if there isn\'t four in a row or a column' do

      before do
        no_win_row = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '2', '', '', ''],
          ['', '', '', '1', '', '', ''],
          ['', '', '', '2', '', '', ''],
          ['2', '1', '2', '1', '', '', ''],
          ['1', '2', '1', '2', '', '', ''],
        ]
        board.instance_variable_set(:@game_board, no_win_row)
      end

      it 'returns false' do
        check_row = board.win_row?
        expect(check_row).to be false
      end
    end

    context 'if there is four in a column, but not four in a row' do

      before do
        win_column_not_row = [
          ['', '', '', '', '', '', ''],
          ['2', '', '', '2', '', '', ''],
          ['2', '', '', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['2', '1', '2', '1', '', '', ''],
          ['1', '2', '1', '2', '', '', ''],
        ]
        board.instance_variable_set(:@game_board, win_column_not_row)
      end

      it 'returns false' do
        check_row = board.win_row?
        expect(check_row).to be false
      end
    end

    context 'if there is four in a row' do

      before do
        win_row = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['1', '2', '1', '', '', '', ''],
          ['1', '2', '1', '2', '', '', ''],
          ['2', '1', '2', '1', '', '', ''],
          ['1', '2', '1', '2', '2', '2', '2'],
        ]
        board.instance_variable_set(:@game_board, win_row)
      end

      it 'returns true' do
        win_row = board.win_row?
        expect(win_row).to be true
      end
    end
  end

  describe '#win_column' do

    context 'if there isn\'t four in a row or a column' do
      before do
        no_win_column = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '2', '', '', ''],
          ['', '', '', '1', '', '', ''],
          ['', '', '', '2', '', '', ''],
          ['2', '1', '2', '1', '', '', ''],
          ['1', '2', '1', '2', '', '', ''],
        ]
        board.instance_variable_set(:@game_board, no_win_column)
      end

      it 'returns false' do
        check_column = board.win_column?
        expect(check_column).to be false
      end
    end

    context 'if there is four in a row, but not in a column' do
      before do
        win_row_not_column = [
          ['', '', '', '', '', '', ''],
          ['', '', '', '', '', '', ''],
          ['1', '2', '1', '', '', '', ''],
          ['1', '2', '1', '2', '', '', ''],
          ['2', '1', '2', '1', '', '', ''],
          ['1', '2', '1', '2', '2', '2', '2'],
        ]
        board.instance_variable_set(:@game_board, win_row_not_column)
      end

      it 'returns false' do
        check_column = board.win_column?
        expect(check_column).to be false
      end
    end

    context 'if there is four in a column' do
      before do
        win_column = [
          ['', '', '', '', '', '', ''],
          ['2', '', '', '2', '', '', ''],
          ['2', '', '', '1', '', '', ''],
          ['2', '1', '2', '2', '', '', ''],
          ['2', '1', '2', '1', '', '', ''],
          ['1', '2', '1', '2', '', '', ''],
        ]
        board.instance_variable_set(:@game_board, win_column)
      end

      it 'returns true' do
        win_column = board.win_column?
        expect(win_column).to be true
      end
    end
  end

  describe '#win_diagonal' do

  end

  describe '#check_end' do

  end
end
