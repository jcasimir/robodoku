require 'minitest/autorun'
require 'minitest/pride'
require './lib/solver'

class SolverTest < Minitest::Test
  def test_it_solves_a_board_with_one_blank_cell
    puzzle = File.read('./test/support/board_missing_one_cell.txt').rstrip
    solver = Solver.new
    calculated_solution = solver.solve(puzzle)
    expected_solution = File.read('./test/support/board_missing_one_cell_solution.txt').rstrip
    assert_equal expected_solution, calculated_solution
  end

  def test_it_solves_a_board_using_row_logic
    puzzle = File.read('./test/support/board_needing_only_row_logic.txt').rstrip
    solver = Solver.new
    calculated_solution = solver.solve(puzzle)
    expected_solution = File.read('./test/support/board_needing_only_row_logic_solution.txt').rstrip
    assert_equal expected_solution, calculated_solution
  end
end
