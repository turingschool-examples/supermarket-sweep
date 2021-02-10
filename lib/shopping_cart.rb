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

  def total_number_of_products
    @products.reduce(0) do |sum, product|
      sum + product.quantity
    end
  end

  def is_full?
    if total_number_of_products >= capacity
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

  def percentage_occupied
    ((total_number_of_products.to_f / capacity) * 100).round(2)
  end

  def test_sorted_products_by_quantity
    @products.sort_by do |product|
      -product.quantity
    end
  end

  def product_breakdown
    @products.group_by do |product|
      product.category
    end
  end 
end
