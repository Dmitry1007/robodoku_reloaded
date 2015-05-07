require 'minitest/pride'
require 'minitest/autorun'
require './lib/row'

class RowTest < Minitest::Test

  def setup
    @easy_row = Row.new([Spot.new(0), Spot.new(2), Spot.new(3), Spot.new(4), Spot.new(5), Spot.new(6), Spot.new(7), Spot.new(8), Spot.new(9)])
    @row1 = Row.new([Spot.new(0), Spot.new(0), Spot.new(2), Spot.new(7), Spot.new(0), Spot.new(1), Spot.new(9), Spot.new(0), Spot.new(0)])
    @row2 = Row.new([Spot.new(0), Spot.new(2), Spot.new(0), Spot.new(4), Spot.new(5), Spot.new(6), Spot.new(7), Spot.new(8), Spot.new(9)])
  end
  
  def test_it_exists
    assert Row
  end

  def test_it_has_spots
    assert_equal [0, 0, 2, 7, 0, 1, 9, 0, 0], @row1.spots.map(&:value)
    assert_equal [0, 2, 0, 4, 5, 6, 7, 8, 9], @row2.spots.map(&:value)
  end
  
  def test_it_has_decided_spots
    assert_equal [2, 7, 1, 9], @row1.decided_spots.map(&:value)
    assert_equal [2, 4, 5, 6, 7, 8, 9], @row2.decided_spots.map(&:value)
  end

  def test_it_has_undecided_spots
    assert_equal [0, 0, 0, 0, 0], @row1.undecided_spots.map(&:value)
    assert_equal [0, 0], @row2.undecided_spots.map(&:value)
  end

  def test_it_can_assess_itself
    @easy_row.assess_row
    assert_equal 1, @easy_row.spots.first.value
  end
end
