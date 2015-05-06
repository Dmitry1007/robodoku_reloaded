require './lib/board'
require 'pry'

class Solver
attr_reader :board

  def initialize(board_values)
    @board = Board.new board_values
  end

  def solve

  end
end
