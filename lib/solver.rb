require './lib/row'

class Solver
  def solve(puzzle)
    # 1. turn the text puzzle into domain objects
    rows = build_rows(puzzle)

    # 2. try solving
    rows.each{|row| row.solve}

    # 3. turn the domain objects back to text
    generate_output(rows)

  end

  def generate_output(rows)
    rows.collect do |row|
      row.cells.collect{|cell| cell.value}.join
    end.join("\n")
  end

  def build_rows(puzzle)
    rows = []

    puzzle.each_line do |line|
      # X26594317
      markers = line.chars

      row = Row.new

      # if the marker is NOT blank
      # convert the string to an integer
      # store that value in the appropriate
      #   position/index of row

      markers.each_with_index do |marker, index|
        if marker != " " && marker != "\n"
          value = marker.to_i
          row.cells[index].value = value
        end
      end

      rows << row
    end

    return rows
  end
end
