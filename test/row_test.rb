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

  def test_it_mass_assigns_known_values
    row = Row.new
    row.set_values("12 456 89")

    assert_equal 1, row.cells[0].value
    assert_equal 2, row.cells[1].value
    assert_equal 4, row.cells[3].value
    assert          row.cells[2].value.nil?
    assert          row.cells[6].value.nil?
  end

  def test_it_converts_to_a_string_representation
    row = Row.new
    row.set_values("12 456 89")
    assert_equal "12 456 89", row.to_s
  end

end
