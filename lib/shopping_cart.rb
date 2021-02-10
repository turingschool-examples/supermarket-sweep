class ShoppingCart
  attr_reader :name, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def capacity
    capacity_to_integer = @capacity.delete("items").to_i
  end


end
