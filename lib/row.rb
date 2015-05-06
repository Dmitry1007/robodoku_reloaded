require './lib/spot'

class Row
attr_reader :spots

  def initialize(spots)
    @spots = spots
  end

  def assess_row
    undecided_spots = spots.reject{|spot| spot.value_decided?}

  end
end
