
class Pantry

  attr_reader :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
  end

  def stock_check(item)
    if stock.keys.include?(item)
      stock[item]
    else
      stock[item] = 0
    end
  end

  def restock(item, quantity)
    stock[item] += quantity
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |k,v|
      if shopping_list.keys.include?(k)
        shopping_list[k] += v
      else
        shopping_list[k] = v
      end
    end
  end

  def convert_units(recipe)
    conversion = {}
    recipe.ingredients.each do |k,v|
      if v > 100
        a = convert_centi_units(v)
        conversion[k] = { quantity: a, units: "Centi-Units" }
      elsif v < 1
        b = convert_milli_units(v)
        conversion[k] = { quantity: b, units: "Milli-Units" }
      else
        conversion[k] = { quantity: v, units: "Universal Units" }
      end
    end
    conversion
  end

  def convert_centi_units(number)
    number/100
  end

  def convert_milli_units(number)
    number*1000
  end

end
