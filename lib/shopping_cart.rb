class ShoppingCart

  attr_reader :name, :capacity, :products, :details

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
    @details = Hash.new(0)
  end

  def change_capacity_to_int
    @capacity = @capacity.to_i
  end

  def add_product(product)
    @products << product
  end
  def find_details
    @details[:name] = @name
    @details[:capacity] = @capacity
    @details
  end
end