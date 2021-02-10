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
    products.reduce(0) do |sum, product|
      sum += product.quantity
    end
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

  def percentage_occupied
    ((total_number_of_products / capacity.to_f) * 100).round(2)
  end

  def sorted_products_by_quantity
    sorted_products = products.sort_by do |product|
      product.quantity
    end
    sorted_products.reverse
  end

  def product_breakdown
    products.group_by do |product|
      products_by_category(product.category)
    end
  end
end
