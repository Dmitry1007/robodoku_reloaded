require 'minitest/pride'
require 'minitest/autorun'
require './lib/column'

class ColumnTest < Minitest::Test

  def test_it_exists
    assert Column
  end

  def test_it_has_spots
    column = Column.new([Spot.new(0), Spot.new(0), Spot.new(2), Spot.new(7), Spot.new(0), Spot.new(1), Spot.new(9), Spot.new(0), Spot.new(0)])
    assert_equal [0, 0, 2, 7, 0, 1, 9, 0, 0], column.spots.map{|spot| spot.value}
  end

  def test_it_has_undecided_spots
    column = Column.new([Spot.new(0), Spot.new(0), Spot.new(2), Spot.new(7), Spot.new(0), Spot.new(1), Spot.new(9), Spot.new(0), Spot.new(0)])
    assert_equal [0, 0, 0, 0, 0], column.undecided_spots.map{|spot| spot.value}
  end

  def test_it_can_assess_itself
    column = Column.new([Spot.new(0), Spot.new(2), Spot.new(3), Spot.new(4), Spot.new(5), Spot.new(6), Spot.new(7), Spot.new(8), Spot.new(9)])
    column.assess_column
    assert_equal 1, column.spots.first.value
  end
end
