require 'minitest/pride'
require 'minitest/autorun'
require './lib/solver'

class SolverTest < Minitest::Test

  def setup
    @solver = Solver.new(File.read("./puzzles/easy_sample.txt").gsub("\n", "").gsub(" ", "0").chars)
    @solver2 = Solver.new(File.read("./puzzles/easy_sample2.txt").gsub("\n", "").gsub(" ", "0").chars)
    @solver3 = Solver.new(File.read("./puzzles/medium_sample_ish.txt").gsub("\n", "").gsub(" ", "0").chars)
    @solver4 = Solver.new(File.read("./puzzles/hard_sample.txt").gsub("\n", "").gsub(" ", "0").chars)
  end

  def test_it_exists
    assert Solver
  end

  def test_it_can_contain_characters
    assert_equal ["026594317", "715638942", "394721865", "163459278", "948267153", "257813694", "531942786", "482176539", "679385421"], @solver.board.rows.map{|row| row.spots.map{|spot| spot.value}}.map{|ele| ele.join}
    assert_equal ["073192546", "219645387", "654387129", "567428913", "932561478", "481973265", "398216754", "146759832", "725834691"], @solver.board.columns.map{|column| column.spots.map{|spot| spot.value}}.map{|ele| ele.join}
    assert_equal ["073219654", "567932481", "398146725", "192645387", "428561973", "216759834", "546387129", "913478265", "754832691"], @solver.board.squares.map{|square| square.spots.map{|spot| spot.value}}.map{|ele| ele.join}
  end

  def test_it_solves_the_simplest_possible_puzzle
    skip
    assert_equal ["826594317", "715638942", "394721865", "163459278", "948267153", "257813694", "531942786", "482176539", "679385421"], @solver.solve
  end

  def test_it_solves_a_slightly_harder_puzzle
    skip
    assert_equal ["826594317", "715638942", "394721865", "163459278", "948267153", "257813694", "531942786", "482176539", "679385421"], @solver2.solve
  end

  def test_it_solves_an_even_harder_puzzle
    skip
    assert_equal ["826594317", "715638942", "394721865", "163459278", "948267153", "257813694", "531942786", "482176539", "679385421"], @solver3.solve
  end
  
  def test_it_solves_a_difficult_puzzle
    skip
    assert_equal ["854219763", "397865421", "261473985", "785126394", "649538172", "132947856", "926384517", "513792648", "478651239"], @solver4.solve 
  end
end
