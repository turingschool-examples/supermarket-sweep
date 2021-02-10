class Product
  attr_reader :category,
              :name,
              :unit_price

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity
    @hoarded = false
  end

  def quantity
    @quantity.to_i
  end

  def total_price
    quantity * unit_price
  end

  def is_hoarded?
    @hoarded
  end

  def hoard
    @hoarded = true
  end
end
