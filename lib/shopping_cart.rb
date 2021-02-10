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
    prior = 0
    @products.each do |product|
      product.quantity += prior.quantity
    prior
    end
  end

  def is_full?
    return @capacity.to_i > 30
  end

  def products_by_category(type)
    @assorted_category = @products.find_all do |product|
      product.category == type
    end
  end
end
