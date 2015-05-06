require './lib/spot'

class Board
attr_reader :spots, :rows

  def initialize(board_values)
    @spots = board_values.map{ |value| Spot.new(value) }
    @rows = spots.each_slice(9).map{ |slice| Row.new(slice) }
  end
end
