require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PantryTest < Minitest::Test

  def test_it_exits
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_stock_is_empty
    pantry = Pantry.new

    assert pantry.stock == {}
  end

  def test_add_stock_with_quantity_zero
    pantry = Pantry.new
  
    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_can_restock
    pantry = Pantry.new
    pantry.stock_check("Cheese")
    pantry.restock("Cheese", 10)

    assert_equal 10, pantry.stock_check("Cheese")
  end

  def test_can_restock_further
    pantry = Pantry.new
    pantry.stock_check("Cheese")
    pantry.restock("Cheese", 10)
    pantry.restock("Cheese",20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_it_can_convert_centi_units
    pantry = Pantry.new

    assert_equal 2, pantry.convert_centi_units(200)
  end

  def test_it_can_convert_milli_units
    pantry = Pantry.new

    assert_equal 750, pantry.convert_milli_units(0.750)
  end

end
