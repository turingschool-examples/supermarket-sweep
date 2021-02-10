class ShoppingCart

  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products(quantity)
    puts quantity.to_i
    products.each do |product|
    product.quantity sum = quantity.to_i
  end
  end

end
