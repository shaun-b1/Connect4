# frozen_string_literal: true

module WinConditions
  def check_row(game_board)
    game_board.each do |row|
      return true if row.each_cons(4).any? { |fours| fours.uniq.size == 1 && fours.first != '' }
    end
    false
  end

  def check_column(game_board)
    check_row(game_board.transpose)
  end
end
