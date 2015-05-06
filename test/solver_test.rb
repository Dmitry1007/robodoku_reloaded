require 'minitest/pride'
require 'minitest/autorun'
require './lib/solver'

class SolverTest < Minitest::Test

  def test_it_exists
    assert Solver
  end

  def test_it_can_contain_characters
    solver = Solver.new("./puzzles/easy_sample.txt")
    assert_equal 0, solver.board
  end

  def test_it_solves
    skip
  end
end
