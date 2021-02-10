class ShoppingCart
  attr_reader :name,
              :capacity,
              :products,
              :assorted_category,
              :quantity_of_products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
    @assorted_category = []
    @quantity_of_products = quantity_of_products
  end

  def add_product(product)
    @products << product
  end

  def details
    return {name: @name, capacity: @capacity}
  end

  def total_number_of_products
    initial_products = 0
    @products.each do |product|
      initial_products += product.quantity
    end
    initial_products
  end

  def is_full?
    if capacity.to_i > total_number_of_products
      false
    else
      true
    end
  end

  def products_by_category(type)
    @assorted_category = @products.find_all do |product|
      product.category == type
    end
  end
end
