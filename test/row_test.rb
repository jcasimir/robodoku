require 'minitest/autorun'
require 'minitest/pride'
require './lib/row'

class RowTest < Minitest::Test
  def test_it_has_nine_cells
    row = Row.new
    assert_equal 9, row.cells.count
  end

  def test_it_solves_itself
    row = Row.new
    row.cells[0].value = 1
    row.cells[1].value = 2
    row.cells[2].value = 3
    row.cells[3].value = 4
    row.cells[4].value = 5
    row.cells[5].value = 6
    row.cells[6].value = 7
    row.cells[7].value = 8

    row.solve
    assert row.cells[8].known?
    assert_equal 9, row.cells[8].value
  end

end