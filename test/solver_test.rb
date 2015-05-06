require 'minitest/pride'
require 'minitest/autorun'
require './lib/solver'

class SolverTest < Minitest::Test

  def setup
    @solver = Solver.new(File.read("./puzzles/easy_sample.txt").gsub("\n", "").gsub(" ", "0").chars)
  end

  def test_it_exists
    assert Solver
  end

  def test_it_can_contain_characters
    assert_equal 0, @solver.board
  end

  def test_it_solves
    skip
  end
end
