class ShoppingCart
  attr_reader :name,
              :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def capacity
    @capacity.to_i
  end

  def add_product(product)
    products << product
  end

  def details
    details_hash = {name: name, capacity: capacity}
  end

  def total_number_of_products
    total_num_products = 0
    products.each do |product|              #todo refactor w/ enumerable
      total_num_products += product.quantity
    end
    total_num_products
  end

  def is_full?
    return true if total_number_of_products > capacity
    false
  end

  def products_by_category(category)
    products.select do |product|
      product.category == category
    end
  end
end
