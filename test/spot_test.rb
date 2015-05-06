require 'minitest/pride'
require 'minitest/autorun'
require './lib/spot'

class SpotTest < Minitest::Test

  def test_it_exists
    assert Spot
  end

  def test_it_has_a_value
    spot = Spot.new("4")
    assert_equal "4", spot.value
  end

  def test_it_has_possibilities
    spot = Spot.new("4")
    assert_equal 9, spot.possibilities.size
  end

  def test_it_can_remove_a_possibility
    spot = Spot.new("0")
    spot.remove_possibility(9)
    assert_equal 8, spot.possibilities.size
    spot.remove_possibility(2)
    assert_equal 7, spot.possibilities.size
  end

  def test_it_can_tell_whether_a_value_has_been_decided
    undecided_spot = Spot.new("0")
    decided_spot = Spot.new("3")
    refute undecided_spot.value_decided?
    assert decided_spot.value_decided?
  end
end
