require 'minitest/pride'
require 'minitest/autorun'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    assert Board
  end
end
