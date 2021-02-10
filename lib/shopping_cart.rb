require './lib/product'

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
    details = {}
    details[:name] = @name
    details[:capacity] = @capacity
    details
  end

  def total_number_of_products
    sum = 0
    @products.each do |product|
    sum += product.quantity
    end
    sum
  end

  def is_full?
    if total_number_of_products > 30
      true
    else
      false
    end
  end
  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end
end
