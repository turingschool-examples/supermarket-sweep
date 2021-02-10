class Product

  attr_reader :category, :name, :unit_price
  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity
  end

  def quantity
    @quantity.to_i
  end

  def total_price
    @unit_price * quantity
  end

  def is_hoarded?
    if quantity >= 30
      true
    else
      false
    end
  end

  def hoard
    quantity * 30
  end
end
