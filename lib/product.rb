class Product
  attr_reader :category,
              :name,
              :unit_price,
              :quantity


  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @quantity = quantity.to_i
    @unit_price = unit_price
  end

  def total_price
    total_cost = (@unit_price * @quantity.to_i)
  end

end
