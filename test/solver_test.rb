require 'minitest/pride'
require 'minitest/autorun'
require './lib/solver'

class SolverTest < Minitest::Test

  def setup
    @solver = Solver.new(File.read("./puzzles/easy_sample.txt").gsub("\n", "").gsub(" ", "0").chars)
    @solver2 = Solver.new(File.read("./puzzles/easy_sample2.txt").gsub("\n", "").gsub(" ", "0").chars)
  end

  def test_it_exists
    assert Solver
  end

  def test_it_can_contain_characters
    assert_equal ["026594317", "715638942", "394721865", "163459278", "948267153", "257813694", "531942786", "482176539", "679385421"], @solver.board.rows.map{|row| row.spots.map{|spot| spot.value}}.map{|ele| ele.join}
  end

  def test_it_solves_the_simplest_possible_puzzle
    assert_equal ["826594317", "715638942", "394721865", "163459278", "948267153", "257813694", "531942786", "482176539", "679385421"], @solver.solve.each_slice(9).to_a.map{|ary| ary.join}
  end

  def test_it_solves_a_slightly_harder_puzzle
    assert_equal ["826594317", "715638942", "394721865", "163459278", "948267153", "257813694", "531942786", "482176539", "679385421"], @solver2.solve.each_slice(9).to_a.map{|ary| ary.join}
  end
end
