require_relative 'board.rb'
require_relative 'tokens.rb'

class Player

  def initialize(name, token)
    @name = name
    @token = token
  end

  attr_reader :name, :token

  def input
    loop do
      input = gets.chomp
      return input.to_i if input.match?(/^[1-7]$/)

      puts 'Invalid input. Please enter a number between 1 and 7'
    end
  end
end
