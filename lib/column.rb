require './lib/spot'

class Column
  attr_reader :spots, :undecided_spots

  def initialize(spots)
    @spots = spots
  end

  def undecided_spots
    @spots.reject{|spot| spot.value_decided?}
  end

  def assess_column
    spots.each do |spot|
      if spot.value_decided?
        undecided_spots.each{|spt| spt.remove_possibility(spot.value)}
      end
    end
  end
end
