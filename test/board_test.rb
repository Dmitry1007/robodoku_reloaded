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

  def test_it_has_rows
    assert_equal 9, @board.rows.size
  end
end
