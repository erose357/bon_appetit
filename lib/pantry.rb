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
    recipe.each do |k,v| #look at each ingredient quantity
      if v > 100                      #determine if > 100 or < 1
        convert_centi_units(v)
        conversion[k] = v        #if > 100 convert to Centi-Units
      elsif v < 1                     #if < 1 convert to Milli-Units
        convert_milli_units(v)
        conversion[k] = v       #else stay Universal Units
      else
      end
      #output a new hash with {ingredient name => {quantity: X, units: "type of unit}
      conversion
    end
  end

  def convert_centi_units(number)
    n = number/100
  end

  def convert_milli_units(number)
    number*1000
  end



end
