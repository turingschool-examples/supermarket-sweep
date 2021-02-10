class ShoppingCart
  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end
  def change_capacity_to_int
    @capacity = @capacity.to_i
  end
end