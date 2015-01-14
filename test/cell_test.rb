require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'

class CellTest < Minitest::Test
  def test_it_initially_has_nine_possibilities
    cell = Cell.new
    assert_equal [1,2,3,4,5,6,7,8,9], cell.possibilities
  end

  def test_it_is_initially_unknown
    cell = Cell.new
    refute cell.known?
  end

  def test_it_can_store_a_value
    cell = Cell.new
    cell.value = 5
    assert cell.known?
  end

  def test_it_can_lose_possibilities
    cell = Cell.new
    cell.remove_possibility(5)
    assert_equal 8, cell.possibilities.count
  end

  def test_it_sets_the_value_when_there_is_only_one_possibility
    cell = Cell.new
    (1..8).each do |number|
      refute cell.known?
      cell.remove_possibility(number)
    end

    assert cell.known?
    assert_equal 9, cell.value
  end
end
