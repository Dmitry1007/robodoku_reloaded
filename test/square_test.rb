require 'minitest/pride'
require 'minitest/autorun'
require './lib/square'

class SquareTest < Minitest::Test

  def setup
    @easy_square = Square.new([Spot.new(0), Spot.new(2), Spot.new(3), Spot.new(4), Spot.new(5), Spot.new(6), Spot.new(7), Spot.new(8), Spot.new(9)])
    @square1 = Square.new([Spot.new(0), Spot.new(0), Spot.new(2), Spot.new(7), Spot.new(0), Spot.new(1), Spot.new(9), Spot.new(0), Spot.new(0)])
    @square2 = Square.new([Spot.new(0), Spot.new(2), Spot.new(0), Spot.new(4), Spot.new(5), Spot.new(6), Spot.new(7), Spot.new(8), Spot.new(9)])
  end
  
  def test_it_exists
    assert Square
  end

  def test_it_has_spots
    assert_equal [0, 0, 2, 7, 0, 1, 9, 0, 0], @square1.spots.map(&:value)
    assert_equal [0, 2, 0, 4, 5, 6, 7, 8, 9], @square2.spots.map(&:value)
  end
  
  def test_it_has_decided_spots
    assert_equal [2, 7, 1, 9], @square1.decided_spots.map(&:value)
    assert_equal [2, 4, 5, 6, 7, 8, 9], @square2.decided_spots.map(&:value)
  end

  def test_it_has_undecided_spots
    assert_equal [0, 0, 0, 0, 0], @square1.undecided_spots.map(&:value)
    assert_equal [0, 0], @square2.undecided_spots.map(&:value)
  end

  def test_it_can_assess_itself
    @easy_square.assess_square
    assert_equal 1, @easy_square.spots.first.value
  end
end
