class ShoppingCart
  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product_name)
    @products << product_name
  end

  def details
    shopping_cart = {
    :name => name,
    :capacity => capacity
    }
  end
end
