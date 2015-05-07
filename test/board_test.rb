require 'minitest/pride'
require 'minitest/autorun'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new(File.read("./puzzles/easy_sample.txt").gsub("\n", "").gsub(" ", "0").chars)
  end

  def test_it_exists
    assert Board
  end

  def test_it_has_spots
    assert_equal 81, @board.spots.size
  end
  
  def test_it_can_return_the_spots_values
    assert_equal 0, @board.spots[0].value
    assert_equal 6, @board.spots[40].value
    assert_equal 1, @board.spots[80].value
  end
  
  def test_it_can_return_the_spots_starting_possibilities
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], @board.spots[0].possibilities
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], @board.spots[40].possibilities
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], @board.spots[80].possibilities
  end

  def test_it_has_rows
    assert_equal 9, @board.rows.size
  end
  
  def test_it_can_return_the_values_of_its_rows
    assert_equal [0, 2, 6, 5, 9, 4, 3, 1, 7], @board.rows[0].spots.map(&:value)
    assert_equal [7, 1, 5, 6, 3, 8, 9, 4, 2], @board.rows[1].spots.map(&:value)
    assert_equal [3, 9, 4, 7, 2, 1, 8, 6, 5], @board.rows[2].spots.map(&:value)
  end
  
  def test_it_has_columns
    assert_equal 9, @board.rows.size
  end
  
  def test_it_can_return_the_values_of_its_columns
    assert_equal [5, 6, 7, 4, 2, 8, 9, 1, 3], @board.columns[3].spots.map(&:value)
    assert_equal [9, 3, 2, 5, 6, 1, 4, 7, 8], @board.columns[4].spots.map(&:value)
    assert_equal [4, 8, 1, 9, 7, 3, 2, 6, 5], @board.columns[5].spots.map(&:value)
  end
  
  def test_it_has_squares
    assert_equal 9, @board.rows.size
  end
  
  def test_it_can_return_the_values_of_its_squares
    assert_equal [5, 4, 6, 3, 8, 7, 1, 2, 9], @board.squares[6].spots.map(&:value)
    assert_equal [9, 1, 3, 4, 7, 8, 2, 6, 5], @board.squares[7].spots.map(&:value)
    assert_equal [7, 5, 4, 8, 3, 2, 6, 9, 1], @board.squares[8].spots.map(&:value)
  end
  
  def test_it_can_tell_if_all_spots_have_been_decided
    refute @board.all_decided?
    @board.evaluate_all_possibilities
    assert @board.all_decided?
  end
end
