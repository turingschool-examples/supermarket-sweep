class ShoppingCart
  attr_reader :name, :capacity, :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {name: @name, capacity: @capacity}
  end

  def test_total_number_of_products
    @products.reduce(0) do |sum, product|
      sum + product.quantity
    end
  end

  def is_full?
    if self.test_total_number_of_products >= self.capacity
      true
    else
      false
    end
  end

  def test_products_by_category(category)
    @products.select do |product|
      product.category == category
    end
  end
end
