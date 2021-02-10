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

  def add_product(product)
    @products << product
  end

  def details
    {name: "#{@name}", capacity: capacity}
  end

end
