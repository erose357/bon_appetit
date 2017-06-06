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

end
