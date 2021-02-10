class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    cart_details = { name: name, capacity: capacity }
  end

  def total_number_of_products
    cart_products.sum
  end

  def cart_products
    all_products = @cart.product[[2]]
  end

end
