require './lib/cell'

class Row
  attr_reader :cells

  def initialize
    @cells = Array.new(9){ Cell.new }
  end

  def solve
    # 1. Find all the values of my known cells
    # 2. Remove those values from the possibilities
    #    of my unknown cells

    known_values = known_cells.collect{|cell| cell.value}

    unknown_cells.each do |unknown|
      known_values.each do |value|
        unknown.remove_possibility(value)
      end
    end
  end

  def known_cells
    cells.select{|cell| cell.known?}
  end

  def unknown_cells
    cells - known_cells
  end

  def set_values(input)
    input.chars.each_with_index do |value, index|
      if value.to_i > 0
        cells[index].value = value.to_i
      end
    end
  end
end
