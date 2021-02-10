class Product
  attr_reader :category,
              :name,
              :unit_price,
              :quantity
  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
  end

  def total_price
    total = (unit_price * quantity.to_f)
    #require "pry";binding.pry
  end

  def is_hoarded?
    @quantity <= 0
  end

  def hoard
    @quantity = 0
  end
end
