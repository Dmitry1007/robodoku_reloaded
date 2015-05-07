require 'minitest/pride'
require 'minitest/autorun'
require './lib/square'

class SquareTest < Minitest::Test

  def test_it_exists
    assert Square
  end

  def test_it_has_spots
    square = Square.new([Spot.new(0), Spot.new(0), Spot.new(2), Spot.new(7), Spot.new(0), Spot.new(1), Spot.new(9), Spot.new(0), Spot.new(0)])
    assert_equal [0, 0, 2, 7, 0, 1, 9, 0, 0], square.spots.map{|spot| spot.value}
  end

  def test_it_has_undecided_spots
    square = Square.new([Spot.new(0), Spot.new(0), Spot.new(2), Spot.new(7), Spot.new(0), Spot.new(1), Spot.new(9), Spot.new(0), Spot.new(0)])
    assert_equal [0, 0, 0, 0, 0], square.undecided_spots.map{|spot| spot.value}
  end

  def test_it_can_assess_itself
    square = Square.new([Spot.new(0), Spot.new(2), Spot.new(3), Spot.new(4), Spot.new(5), Spot.new(6), Spot.new(7), Spot.new(8), Spot.new(9)])
    square.assess_square
    assert_equal 1, square.spots.first.value
  end
end
