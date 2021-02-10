class ShoppingCart
  attr_reader :name,
              :capacity,
              :products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.delete('items').to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    detail = {name: name, capacity: capacity}
  end

  def total_number_of_products
    total_products = 0
    products.each do |product|
      total_products += product.quantity
    end
    total_products
  end

  def is_full?
    if total_number_of_products >= capacity
      true
    else
      false
    end
  end

  def products_by_category(category)
    products.select do |product|
      product.category == category
    end
  end

  def percentage_occupied
    percent = total_number_of_products / capacity.to_f * 100
    percent.round(2)
  end

  def sorted_products_by_quantity
  end

  def product_breakdown
  end
end
