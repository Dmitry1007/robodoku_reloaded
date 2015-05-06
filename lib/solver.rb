require './lib/board'
require 'pry'

class Solver
attr_reader :board

  def initialize(board_values)
    @board = Board.new(board_values)
  end

  def solve
    until board.all_decided?
      board.evaluate_all_possibilities
    end
    board.spots.map {|spot| spot.value}
  end
end
