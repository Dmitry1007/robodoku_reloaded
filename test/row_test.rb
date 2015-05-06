require 'minitest/pride'
require 'minitest/autorun'
require './lib/row'

class RowTest < Minitest::Test

  def test_it_exists
    assert Row
  end

  def test_it_has_spots
    row = Row.new([Spot.new(0), Spot.new(0), Spot.new(2), Spot.new(7), Spot.new(0), Spot.new(1), Spot.new(9), Spot.new(0), Spot.new(0)])
    assert_equal [0, 0, 2, 7, 0, 1, 9, 0, 0], row.spots.map{|spot| spot.value}
  end

  def test_it_has_undecided_spots
    row = Row.new([Spot.new(0), Spot.new(0), Spot.new(2), Spot.new(7), Spot.new(0), Spot.new(1), Spot.new(9), Spot.new(0), Spot.new(0)])
    assert_equal [0, 0, 0, 0, 0], row.undecided_spots.map{|spot| spot.value}
  end

  def test_it_can_assess_itself
    row = Row.new([Spot.new(0), Spot.new(2), Spot.new(3), Spot.new(4), Spot.new(5), Spot.new(6), Spot.new(7), Spot.new(8), Spot.new(9)])
    row.assess_row
    assert_equal 1, row.spots.first.value
  end
end
