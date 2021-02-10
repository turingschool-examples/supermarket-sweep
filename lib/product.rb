class Product
  attr_reader :category, :name, :unit_price, :quantity, :hoard
  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
    @total_price = total_price

  end

  def total_price
    unit_price * quantity
  end

  def is_hoarded?
    false
    if hoard
      true
    end
  end
end
