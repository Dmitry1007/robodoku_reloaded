require 'pry'
require_relative 'spot'
require_relative 'row'
require_relative 'column'
require_relative 'square'

class Board
attr_reader :spots, :rows, :columns, :squares

  def initialize(board_values)
    @spots = board_values.map{ |value| Spot.new(value.to_i) }
    @rows = spots.each_slice(9).map{ |slice| Row.new(slice) }
    @columns = spots.each_slice(9).to_a.transpose.map{ |slice| Column.new(slice) }
    @squares = spots.each_slice(9).each_slice(3).flat_map{|ary| ary.transpose.flatten}.each_slice(9).map{|slice| Square.new(slice)}
  end

  def all_decided?
    spots.all? {|spot| spot.value_decided?}
  end

  def evaluate_all_possibilities
    self.rows.each{|row| row.assess_row}
    self.columns.each{|column| column.assess_column}
    self.squares.each{|square| square.assess_square}
  end
end
