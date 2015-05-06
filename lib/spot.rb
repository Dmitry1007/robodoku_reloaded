require 'pry'

class Spot
attr_reader :value, :possibilities

  def initialize(value)
    @value = value
    @possibilities = (1..9).to_a
  end

  def remove_possibility(num)
    @possibilities.delete(num)
    if possibilities.length == 1
      @value = possibilities.first
    end
  end

  def value_decided?
    value != "0"
  end
end
