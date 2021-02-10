class Product
  attr_reader :category, :name, :unit_price, :quantity, :total_price, :hoard

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity.to_i
    @total_price = total_price
    @hoard = hoard
  end
  def total_price
    @total_price = @unit_price * @quantity
  end

  def hoard
    if @quantity >= 10
      true
    else
      false
    end
  end

  def is_hoarded?
    if @hoard
      true
    else
      false
    end
  end

end
