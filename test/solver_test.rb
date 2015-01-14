require 'minitest/autorun'
require 'minitest/pride'
require './lib/solver'

class SolverTest < Minitest::Test
  def test_it_solves_a_board_with_one_blank_cell
    puzzle = File.read('./test/support/board_missing_one_cell.txt').strip
    solver = Solver.new
    calculated_solution = solver.solve(puzzle)
    expected_solution = File.read('./test/support/board_missing_one_cell_solution.txt').strip
    assert_equal expected_solution, puzzle
  end
end
