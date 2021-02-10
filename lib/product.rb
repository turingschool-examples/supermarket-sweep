class Product
  attr_reader :category, :name, :unit_price, :quantity

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
  end

  # returns the sum of the unit price multiplied by the quantity
  # no argument -> float
  def total_price
    unit_price * quantity
  end

end
