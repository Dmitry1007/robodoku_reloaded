require_relative 'spot'

class Row
  attr_reader :spots, :undecided_spots

  def initialize(spots)
    @spots = spots
  end

  def undecided_spots
    @spots.reject(&:value_decided?)
  end

  def decided_spots
    @spots.select(&:value_decided?)
  end

  def assess_row
    spots.each do |spot|
      if spot.value_decided?
        undecided_spots.each{|spt| spt.remove_possibility(spot.value)}
      end
    end
  end
end
