class Product
  attr_reader :category, :name, :unit_price, :quantity, :hoard
  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity=  quantity.to_i
    hoard = true
  end

  def total_price
    @unit_price * @quantity
  end

  def is_hoarded?
    if hoard != true
      hoard = false
    end
  end
end
