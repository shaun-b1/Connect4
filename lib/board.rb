# frozen_string_literal: true
require_relative 'tokens.rb'
require_relative 'win_conditions.rb'

class Board
  include WinConditions

  attr_accessor :game_board

  def initialize(game_board = Array.new(6, Array.new(7, '')))
    @game_board = game_board
  end

  def valid_move?(column)
    game_board.any? { |row| row[column].empty? }
  end

  def full?
    game_board.flatten.none? { |position| position.empty? }
  end

  def win_row?
    check_row(game_board)
  end

  def win_column?
    check_column(game_board)
  end

  def win_diagonal?
    
  end

  def check_end?

  end
end
