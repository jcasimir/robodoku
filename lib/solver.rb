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
      row.to_s
    end.join("\n")
  end

  def build_rows(puzzle)
    puzzle.each_line.collect do |line|
      row = Row.new
      row.set_values(line.chomp)
      row
    end
  end
end
