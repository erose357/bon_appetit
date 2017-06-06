require './lib/recipe'
require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'


class RecipeTest < Minitest::Test
  def test_it_has_a_name
    r = Recipe.new("Cheese Pizza")
    assert_equal "Cheese Pizza", r.name
  end

  def test_it_can_add_an_ingredient
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 500) # 500 "UNIVERSAL UNITS"
    assert_equal ["Flour"], r.ingredient_types
    r.add_ingredient("Cheese", 1500)
    assert_equal ["Flour", "Cheese"], r.ingredient_types
  end

  def test_it_tracks_amount_of_a_recipe_required
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 500)

    assert_equal 500, r.amount_required("Flour")
  end

  def test_it_can_convert_centi_units
    r = Recipe.new("Cheese Pizza")
    pantry = Pantry.new
    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)
    expected = {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
                "Cheese"         => {quantity: 75, units: "Universal Units"},
                "Flour"          => {quantity: 5, units: "Centi-Units"}}

    assert_equal expected, pantry.convert_units(r)
  end

  def test_it_can_convert_a_different_recipe
    r = Recipe.new("Cheese Pizza")
    pantry = Pantry.new
    r.add_ingredient("Cayenne Pepper", 0.75)
    r.add_ingredient("Cheese", 95)
    r.add_ingredient("Flour", 800)
    expected = {"Cayenne Pepper" => {quantity: 750, units: "Milli-Units"},
                "Cheese"         => {quantity: 95, units: "Universal Units"},
                "Flour"          => {quantity: 8, units: "Centi-Units"}}

    assert_equal expected, pantry.convert_units(r)
  end

  def test_add_to_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    pantry.add_to_shopping_list(r)
    expected = {"Cheese" => 20, "Flour" => 20}

    assert_equal expected, pantry.shopping_list
  end

  def test_add_another_recipe
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(r)
    expected = {"Cheese" => 20, "Flour" => 20}

    assert_equal expected, pantry.shopping_list

    r = Recipe.new("Spaghetti")
    r.add_ingredient("Noodles", 10)
    r.add_ingredient("Sauce", 10)
    r.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)
    expected = {"Cheese" => 25, "Flour" => 20, "Noodles" => 10, "Sauce" => 10}

    assert_equal expected, pantry.shopping_list
  end

end
