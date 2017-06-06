require 'pry'
class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(item)
    stock[item]
  end

  def add_stock(item)
    stock[item] = 0
  end


  def restock(item, quantity)
    stock[item] += quantity
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
